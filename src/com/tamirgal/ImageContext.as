/*

ImageContext.as

Copyright (c) 2009 Tamir Gal, http://www.tamirgal.com, All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice,
        this list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright 
        notice, this list of conditions and the following disclaimer in 
        the documentation and/or other materials provided with the distribution.

    3. The names of the authors may not be used to endorse or promote products
        derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR
OR ANY CONTRIBUTORS TO THIS SOFTWARE BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.tamirgal
{
	import mx.controls.Image;
	import mx.core.Container;
		
	public class ImageContext
	{
		public var imageUrl:String = null;
		public var thumbUrl:String = null;
		public var name:String = null;
		public var thumbContainer:Container = null;
		public var thumb:Image = null;
		public var previewImage:Image = null;
		public var isFirst:Boolean = false;
		public var isLast:Boolean = false;
		public var title:String = "";
		public var description:String = "";
		public var viewed:Boolean = false;
		
		public function ImageContext()
		{
		}
		
		public function loadData(data:Object):void
		{
			this.imageUrl = StringUtil.absPath(data.image);
			
			if (StringUtil.isNullOrEmpty(data.thumbnail))
				this.thumbUrl = this.imageUrl
			else
				this.thumbUrl = StringUtil.absPath(data.thumbnail);
			
			if (StringUtil.isNullOrEmpty(data.title))
				this.title = StringUtil.fileName(data.image);	
			else
				this.title = data.title;
				
			this.description = data.description;
		}

	}
}