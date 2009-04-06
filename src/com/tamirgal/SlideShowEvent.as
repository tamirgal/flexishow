/*

SlideShowEvent.as

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
	import flash.events.Event;

	public class SlideShowEvent extends Event
	{
		public function SlideShowEvent(type:String, imageCtx:ImageContext)
		{
			super(type);
			
			this.imageCtx = imageCtx;
		}

        // Define static constant.
        public static const THUMB_CLICKED:String = "thumbClicked";
        public static const THUMB_HOVER_IN:String = "thumbHoverIn";
        public static const THUMB_HOVER_OUT:String = "thumbHoverOut";
        public static const THUMB_SELECTED_CHANGED:String = "selectedItemChanged";
        public static const BUTTON_FWD_CLICKED:String = "buttonFwdClicked";
        public static const BUTTON_RWD_CLICKED:String = "buttonRwdClicked";
        public static const BUTTON_PLAY_CLICKED:String = "buttonPlayClicked";
        public static const BUTTON_PAUSE_CLICKED:String = "buttonPauseClicked";
        public static const IMAGE_TIMEOUT:String = "onImageTimout";
            
        // Define a public variable to hold the state of the enable property.
        public var imageCtx:ImageContext = null;
        public var otherImageCtx:ImageContext = null;

        // Override the inherited clone() method. 
        override public function clone():Event {
            return new SlideShowEvent(type, imageCtx);
        }
		
	}

}