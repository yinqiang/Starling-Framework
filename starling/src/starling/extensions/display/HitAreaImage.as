package starling.extensions.display
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.textures.Texture;
	
	/**
	 * 有自定义热区的图片类
	 * @author YQ
	 * 
	 */
	public class HitAreaImage extends Image
	{
		/**
		 * 热区
		 */
		public var hit:BitmapData;
		
		/**
		 * 创建有触摸热区的Starling Image
		 * @param texture 显示时使用的材质
		 * @param hitArea 触摸热区
		 * 
		 */
		public function HitAreaImage(texture:Texture, hitArea:BitmapData)
		{
			hit = hitArea;
			super(texture);
		}
		
		/**
		 * 碰撞检测，只有非透明区域才会有碰撞
		 * @param localPoint
		 * @param forTouch
		 * @return 
		 * 
		 */
		override public function hitTest(localPoint:Point, forTouch:Boolean=false):DisplayObject
		{
			if (localPoint && (!visible || !touchable))
			{
				return null;
			}
			else if (hit && hit.getPixel32(localPoint.x, localPoint.y) <= 0)
			{
				return null;
			}
			return this;
		}
	}
}