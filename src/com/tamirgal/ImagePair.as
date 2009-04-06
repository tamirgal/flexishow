package com.tamirgal
{
	import mx.controls.Image;
	
	public class ImagePair
	{
		private var mainImage:Image;
		private var standbyImage:Image;
		
		public function ImagePair(image1:Image, image2:Image)
		{
			mainImage = image1;
			standbyImage = image2;
		}

	}
}