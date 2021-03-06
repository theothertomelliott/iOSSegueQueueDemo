# iOSSegueQueueDemo

## Description

This project demonstrates some weird and rather annoying behaviour that you might see in an iOS project when you don't use queues properly.

## The Problem

UI operations in iOS are designed to be run on the "main" queue. If you get this wrong, it's often evident immediately: your labels don't update or other visible changes don't happen.

However, if you execute a segue on a non-UI thread, you can end up with some very weird and confusing behaviour without a clear idea of where the cause may lie.

## The Demonstration

If you open and run this project in the simulator, you will see a simple view with two buttons.

![Starting View](Screenshots/StartScreen.png)

Click the top button and you will be taken to a view with a sampling of components.

![Second View - Segue on Main](Screenshots/SecondScreen-MainQueue.png)

From here, clicking back will take you to the original screen. Now, click the lower, "background queue" button.

![Second View - Segue on Background](Screenshots/SecondScreen-BackgroundQueue.png)

Half of the components don't render correctly! This is an obvious example of the behaviour. However, the problem can also manifest in more subtle ways, such as the keyboard not rendering while remaining responsive to taps.

## The Solution

In order to avoid this, you need to make sure that all your segues are called from the main queue. This could be an involved process, requiring careful consideration of the flow to each of your segues, specifically where they're called in blocks, or using asynchronous code. 

Alternatively, you could just wrap them all in a dispatch block:

    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self performSegueWithIdentifier:@"detailSegue" sender:self];
    });