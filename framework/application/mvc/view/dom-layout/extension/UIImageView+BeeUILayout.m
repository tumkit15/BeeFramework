//
//	 ______    ______    ______
//	/\  __ \  /\  ___\  /\  ___\
//	\ \  __<  \ \  __\_ \ \  __\_
//	 \ \_____\ \ \_____\ \ \_____\
//	  \/_____/  \/_____/  \/_____/
//
//
//	Copyright (c) 2013-2014, {Bee} open source community
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

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "UIImageView+BeeUILayout.h"

@implementation UIImageView(BeeUILayout)

+ (BOOL)supportForUISizeEstimating
{
	return YES;
}

- (CGSize)estimateUISizeByBound:(CGSize)bound
{
	if ( nil == self.image )
		return CGSizeZero;

	if ( UIViewContentModeScaleAspectFill == self.contentMode )
	{
		return AspectFillSize( self.image.size, bound );
	}
	else if ( UIViewContentModeScaleAspectFit == self.contentMode )
	{
		return AspectFitSize( self.image.size, bound );
	}

	return self.image.size;
}

- (CGSize)estimateUISizeByWidth:(CGFloat)width
{
	if ( nil == self.image )
		return CGSizeZero;

	if ( UIViewContentModeScaleAspectFill == self.contentMode )
	{
		return AspectFillSizeByWidth( self.image.size, width );
	}
	else if ( UIViewContentModeScaleAspectFit == self.contentMode )
	{
		return AspectFitSizeByWidth( self.image.size, width );
	}

	return self.image.size;
}

- (CGSize)estimateUISizeByHeight:(CGFloat)height
{
	if ( nil == self.image )
		return CGSizeZero;

	if ( UIViewContentModeScaleAspectFill == self.contentMode )
	{
		return AspectFillSizeByHeight( self.image.size, height );
	}
	else if ( UIViewContentModeScaleAspectFit == self.contentMode )
	{
		return AspectFitSizeByHeight( self.image.size, height );
	}

	return self.image.size;
}

@end

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
