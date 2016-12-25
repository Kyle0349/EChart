<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>EChart</title>
		<script src="static/js/echarts/echarts.js"></script>
		
	</head>
	<body>
		<div id="mainMapDiv" style="width: 100%; height: 500px; border: 1px solid;"></div>
  	
	  	<script >
	  		var mapChart;
	  		var option_map;
	  		var series_country;
	  		window.onload = function(){
	  			indexFun.initEChart();
	  		};
	  		var indexFun = function(){
	  			return{
	  				initEChart: function(){
	  					require.config({
				  			paths:{
				  				echarts:"static/js/echarts"
				  			}
				  		});
				  		require(
				  			[
				  				'echarts',
				  				'echarts/chart/map'
				  			],
				  			function(echart){
				  				mapChart = echart.init(document.getElementById('mainMapDiv'));
				  				operateMap.initOptionMap();
				  				operateMap.initSeriesCountry();
				  				operateMap.showMap_country();
				  			}
				  		);
	  				},
	  			};
	  		}();
	  		
	  		//map operation
	  		var operateMap = function(){
	  			return{
	  				initOptionMap: function(){
	  					option_map={
		  					tooltip : {
						        trigger: 'item',
						        formatter: '{b}'
						    },
						    series : []
		  				};
	  				},
	  				//init series
	  				initSeriesCountry: function(){
	  					series_country = {
	  						name: '中国',
				            type: 'map',
				            mapType: 'china',
				            selectedMode : 'multiple',
				            itemStyle:{
				                normal:{label:{show:true}},
				                emphasis:{label:{show:true}}
				            },
				            data:[]
	  					}
	  				},
	  				
	  				//show the map on div
	  				showMap_country: function(){
	  					option_map.series.push(series_country);
	  					mapChart.setOption(option_map,true);
	  				}
	  			};
	  		}();
	  		
	  		
	  		
	  	
	  	</script>
	</body>
</html>