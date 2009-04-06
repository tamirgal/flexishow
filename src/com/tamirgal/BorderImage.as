package com.tamirgal
{
	/*
	 * From: http://www.flexer.info/2008/06/12/continuing-image-with-border/
	 */
	import mx.controls.Image;
	
	[Style(name="borderColor", type="uint", format="Color", inherit="no")]
	[Style(name="borderThickness", type="Number", format="Length", inherit="no")]
	[Style(name="borderAlpha", type="Number", format="Length", inherit="no")]
            
	public class BorderImage extends Image
	{
		public function BorderImage()
		{
		}

        // initial position
        private var _recalX:Number;
        private var _recalY:Number;
 
        // initialization
        private function init():void
        {
            // we save the initial position
            _recalX = this.x;
            _recalY = this.y;
        }
 
		// overriding the update function
		override protected function updateDisplayList(w:Number,h:Number):void
		{
		    super.updateDisplayList(w,h);
		    // clear graphics
		    // we want only one rectangle
		    graphics.clear();
		    // set line style with with 0 and alpha 0
		    graphics.lineStyle(0,getStyle('borderColor'),0,false);
		    // draw rectangle
		    graphics.beginFill(getStyle('borderColor'),getStyle('borderAlpha'));
		    var thickness:Number = getStyle('borderThickness');
		    var startX:Number;
		    var startY:Number;
		    var endX:Number;
		    var endY:Number;
		    startX = -thickness;
		    endX = contentWidth + thickness*2;
		    startY = -thickness;
		    endY = contentHeight + thickness*2;
		    if (getStyle("horizontalCenter") == undefined)
		    {
		        // adjust the position 
		        // calculation based on initial position
		        x = _recalX + thickness;
		    }
		    if (getStyle("horizontalAlign") == "center")
		    {
		        // adjust the position 
		        // calculation based on initial position
		        startX = Math.floor((width - contentWidth)/2) - thickness;
		    }
		    if (getStyle("verticalCenter") == undefined)
		    {
		        // adjust the position 
		        // calculation based on initial position
		        y = _recalY + thickness;
		    }
		    if (getStyle("verticalAlign") == "middle")
		    {
		        // adjust the position 
		        // calculation based on initial position
		        startY = Math.floor((height - contentHeight)/2) - thickness;
		    }
		    graphics.drawRect(startX,startY,endX,endY);
		    graphics.endFill();
		}
	}
}