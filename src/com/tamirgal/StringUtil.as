/*

StringUtil.as

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
	import mx.core.Application;
	
	public class StringUtil
	{
		public function StringUtil()
		{
		}
		
	
		public static function isNullOrEmpty(str:String):Boolean
		{
			return (str == null || str == "");
		}
		
		public static function fileName(path:String):String
		{
			if (path.indexOf("/") < 0)
				return path;
				
			var index:int = path.lastIndexOf("/");
			if(index == path.length-1)
				return "";
				
			return path.substr(path.lastIndexOf("/")+1); 
		}
		
		public static function absPath(path:String):String
		{
			if (path.substr(0, 7) == "http://")
				return path;
				
			var res:String = Application.application.url;
			
			if (res.substr(0, 7) != "http://")
				return path;
			
			if ( res.indexOf("/") > 0 )
				res = res.substring(0, res.lastIndexOf("/")+1);
			else
				res = "";
				
			res += path;
			return res;
		}

	}
}