//
//	 ______    ______    ______
//	/\  __ \  /\  ___\  /\  ___\
//	\ \  __<  \ \  __\_ \ \  __\_
//	 \ \_____\ \ \_____\ \ \_____\
//	  \/_____/  \/_____/  \/_____/
//
//
//	Copyright (c) 2014-2015, Geek Zoo Studio
//	http://www.bee-framework.com
//
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the "Software"),
//	to deal in the Software without restriction, including without limitation
//	the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//	IN THE SOFTWARE.
//

#import "Bee.h"

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
#if (__ON__ == __BEE_DEVELOPMENT__)

#pragma mark -

#undef	MAX_MEMORY_HISTORY
#define MAX_MEMORY_HISTORY	(100)

#pragma mark -

@interface ServiceDebugger_MemoryModel : BeeModel

@property (nonatomic, readonly) int64_t				usedBytes;
@property (nonatomic, readonly) int64_t				totalBytes;
@property (nonatomic, readonly) float				usage;
@property (nonatomic, readonly) int64_t				manualBytes;
@property (nonatomic, readonly) NSMutableArray *	manualBlocks;
@property (nonatomic, readonly) NSMutableArray *	chartDatas;
@property (nonatomic, readonly) NSUInteger			lowerBound;
@property (nonatomic, readonly) NSUInteger			upperBound;
@property (nonatomic, readonly) BOOL				warningMode;

AS_SINGLETON( ServiceDebugger_MemoryModel )

- (void)allocAll;
- (void)freeAll;

- (void)alloc50M;
- (void)free50M;

- (void)toggleWarning;

@end

#endif	// #if (__ON__ == __BEE_DEVELOPMENT__)
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
