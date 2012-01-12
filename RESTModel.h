//
//  RESTModel.h
//
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"


@interface RESTModel : NSObject {
    
}

+(NSString *) getPath:(NSString *)path withParams:(NSMutableDictionary *)params isSynchronous:(BOOL)isSynch error:(NSError*) error;
+(NSString *) postPath:(NSString *)path withParams:(NSMutableDictionary *)params isSynchronous:(BOOL)isSynch;
+(NSString *) deletePath:(NSString *)path withParams:(NSMutableDictionary *)params isSynchronous:(BOOL)isSynch;

-(NSString *) putPath:(NSString *)path withParams:(NSMutableDictionary *)params isSynchronous:(BOOL)isSynch;
@end
