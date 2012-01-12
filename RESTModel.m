//
//  RESTModel.m
//  storiesiOS
//

#import "RESTModel.h"
#import "NSDictionary+UrlEncoding.h"


@implementation RESTModel

+(NSString *) postPath:(NSString *)path withParams:(NSMutableDictionary *)params isSynchronous:(BOOL)isSynch {
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:path]];
    for (id key in [params allKeys]) {
        [request addPostValue:[params objectForKey:key] forKey:key];
    }
    if (isSynch) {
        [request startSynchronous];
        
        NSError *error = [request error];
        if (!error) {
            NSString *response = [request responseString];
            return response;
        }
        else {
            //TODO: INTERPRET ERRORS
            return [NSString stringWithFormat:@"%@", [error description]];
        }    
    }
    else {
        [request setDelegate:self];
        [request startAsynchronous];
        return @"Asynch";
    }
}

+(NSString *) getPath:(NSString *)path withParams:(NSMutableDictionary *)params isSynchronous:(BOOL)isSynch  error:(NSError*) error{
	
	NSString *urlString  = [NSString stringWithFormat:@"%@?%@", path, [params urlEncodedString]];
	
	NSURL *url = [NSURL URLWithString:urlString];
	
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setTimeOutSeconds:30];
    if (isSynch) {
        [request startSynchronous];
        
        error = [request error];
        if (!error) {
            NSString *response = [request responseString];
            return response;
        }
        else {
            //TODO: INTERPRET ERRORS
            if ([request responseStatusCode] >= 400) {
                return [NSString stringWithFormat:@"{\"error\":\"%d\"}", [request responseStatusCode]];
            } else {
                return [NSString stringWithFormat:@"%@", [error description]];
            }
        }
    }
    else {
        [request setDelegate:self];
        [request startAsynchronous];
        return @"Asynch";
    }
    
}
+(NSString *) deletePath:(NSString *)path withParams:(NSMutableDictionary *)params isSynchronous:(BOOL)isSynch {
    NSString *urlString  = [NSString stringWithFormat:@"%@?%@", path, [params urlEncodedString]];
	
	NSURL *url = [NSURL URLWithString:urlString];
	
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];

    [request setRequestMethod:@"DELETE"];
    if (isSynch) {
        [request startSynchronous];
        
        NSError *error = [request error];
        if (!error) {
            NSString *response = [request responseString];
            return response;
        }
        else {
            //TODO: INTERPRET ERRORS
            return [NSString stringWithFormat:@"%@", [error description]];
        }    
    }
    else {
        [request setDelegate:self];
        [request startAsynchronous];
        return @"Asynch";
    }

}
-(NSString *) putPath:(NSString *)path withParams:(NSMutableDictionary *)params isSynchronous:(BOOL)isSynch {
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:path]];

    for (id key in [params allKeys]) {
        [request addPostValue:[params objectForKey:key] forKey:key];
    }
    
        [request setRequestMethod:@"PUT"];
    if (isSynch) {
        [request startSynchronous];
        
        NSError *error = [request error];
        if (!error) {
            NSString *response = [request responseString];
            return response;
        }
        else {
            //TODO: INTERPRET ERRORS
            return [NSString stringWithFormat:@"%@", [error description]];
        }    
    }
    else {
        [request setDelegate:self];
        [request startAsynchronous];
        return @"Asynch";
    }

}
@end
