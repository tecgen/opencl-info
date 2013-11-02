//
//  BusinessLogic.m
//  OpenCLTest
//
//  Created by Marco Pehla on 08.09.13.
//  Copyright (c) 2013 tecgen.de. All rights reserved.
//

#import "BusinessLogic.h"
#import <stdio.h>
#import <stdlib.h>
#import <string.h>
#include <OpenCl/cl.h>



@implementation BusinessLogic

-(NSString*) execute {
    NSLog(@"executing business logic:\n");
    
    NSString *result = @"";
    
    /* Host/device data structures */
    cl_platform_id platform;
    cl_device_id *devices;
    cl_uint num_devices, addr_data;
    cl_int i, err;
    
    /* Extension data */
    char name_data[48];
    char ext_data[4096];
    
    /* Identify a platform */
    err = clGetPlatformIDs(1, &platform, NULL);
    if(err < 0) {
        perror("Couldn't find any platforms");
        exit(1);
    }
    
    /* Determine number of connected devices */
    err = clGetDeviceIDs(platform, CL_DEVICE_TYPE_ALL, 1, NULL, &num_devices);
    if(err < 0) {
        perror("Couldn't find any devices");
        exit(1);
    }
    
    /* Access connected devices */
    devices = (cl_device_id*)
    malloc(sizeof(cl_device_id) * num_devices);
    clGetDeviceIDs(platform, CL_DEVICE_TYPE_ALL,
                   num_devices, devices, NULL);
    
    /* Obtain data for each connected device */
    for(i=0; i<num_devices; i++) {
        
        err = clGetDeviceInfo(devices[i], CL_DEVICE_NAME,
                              sizeof(name_data), name_data, NULL);
        if(err < 0) {
            perror("Couldn't read extension data");
            exit(1);
        }
        clGetDeviceInfo(devices[i], CL_DEVICE_ADDRESS_BITS,
                        sizeof(ext_data), &addr_data, NULL);
        
        clGetDeviceInfo(devices[i], CL_DEVICE_EXTENSIONS,
                        sizeof(ext_data), ext_data, NULL);
        
        result = [result stringByAppendingString:@"NAME: \n"];
        result = [result stringByAppendingString:[NSString stringWithUTF8String:name_data]];
        
        //result = [result stringByAppendingString:@"ADDRESS_WIDTH: \n"];
        //result = [result stringByAppendingString:[NSString stringWithUTF8String:addr_data]];
        
        result = [result stringByAppendingString:@"\nEXTENSIONS: \n"];
        result = [result stringByAppendingString:[NSString stringWithUTF8String:ext_data]];
        
    }
    
    free(devices);
    
    
    return result;
}

@end
