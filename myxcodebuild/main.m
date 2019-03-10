#import <Foundation/Foundation.h>
#import "Xcode3CommandLineBuildTool.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSProcessInfo *processInfo = [NSProcessInfo processInfo];

        // Initialize the Xcode object that does actual work
        Xcode3CommandLineBuildTool *buildTool = [Xcode3CommandLineBuildTool sharedCommandLineBuildTool];

        // Set name to be used in output
        buildTool.name = [[processInfo.arguments firstObject] lastPathComponent];

        // Pass all commandline arguments, except for the path to binary
        buildTool.arguments = [processInfo.arguments subarrayWithRange:NSMakeRange(1, processInfo.arguments.count-1)];

        // Use the same environment variables as the myxcodebuild binary
        buildTool.environment = processInfo.environment;

        // Use standard output & error for logging, ignore standard input
        buildTool.standardError = [NSFileHandle fileHandleWithStandardError];
        buildTool.standardOutput = [NSFileHandle fileHandleWithStandardOutput];
        buildTool.standardInput = [NSFileHandle fileHandleWithNullDevice];

        // Run the command
        [buildTool run];

        // Return exit code
        return (int)buildTool.exitStatus;
    }
}
