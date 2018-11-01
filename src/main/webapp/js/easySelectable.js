//예약 테이블 js

/*
Author: mee4dy@gmail.com
*/
(function($){
	//selectable html elements
	$.fn.easySelectable = function(options){
		var el = $(this);
		var options = $.extend({
			'item': 'li',
			'state': true,
			onSelecting: function(el){

			},
			onSelected: function(el){
				
			},
			onUnSelected: function(el){
				
			}
		}, options);
			el.on('dragstart', function(event) { event.preventDefault(); });
			el.off('mouseover');
			el.addClass('easySelectable');
			if(options.state){
				el.find(options.item).addClass('es-selectable');
				
		  		el.on('mousedown', options.item, function(e){
		  			var confirm = $(this).hasClass('create-used');
		  			if(!confirm){
			  			$(this).trigger('start_select');
						var offset = $(this).offset();
						var hasClass = $(this).hasClass('es-selected');
						var prev_el = false;
						el.on('mouseover', options.item, function(e){
							if(prev_el==$(this).index()) return true;
							prev_el = $(this).index();
							
						});
						if(!hasClass){
							$('.serviceable').addClass('create-used');
							$('.serviceable').html('이미 테이블을 선택하셨습니다');
							$(this).addClass('es-selected').trigger('selected');
							$(this).removeClass('create-used');
							$(this).html("선택");
							el.trigger('selected');
							options.onSelecting($(this));
							options.onSelected($(this));
						}
						else{
							$('.serviceable').removeClass('create-used');
							$('.serviceable').html('예약가능(4인)');
							$(this).removeClass('es-selected').trigger('unselected');
							$(this).html("예약가능(4인)");
							el.trigger('unselected');
							options.onSelecting($(this));
							options.onUnSelected($(this));
						}
						var relativeX = (e.pageX - offset.left);
						var relativeY = (e.pageY - offset.top);
					}
				});
				$(document).on('mouseup', function(){
					el.off('mouseover');
			    });
			}
			else{
				el.off('mousedown');
			}
		
	};
})(jQuery);
