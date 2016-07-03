@futura_med: "Futura Medium","Function Pro Medium","Ubuntu Regular","Trebuchet MS Regular","DejaVu Sans Book";

@ocean: #eaf8fa;

@terrain_0: transparent; // 0m
@terrain_1: #d8e9ca; // 1m - 600m
@terrain_2: #BFD4AD; // 601m - 1200m
@terrain_3: #F8F3CD; // 1201m - 1800m
@terrain_4: #D9BE67; // 1801m - 2400m
@terrain_5: #C1933D; // 2401m - 3000m
@terrain_6: #745926; // 3000m - ABOVE

Map {
  background-color: @ocean;
}

#countries {
  
  ::outline {
    line-color: #85c5d3;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: @terrain_1;
}

#graticules {
  line-width:0;
  line-color:#000;
  line-dasharray: 5, 5;
  text-face-name:@futura_med;
  text-name:[display];
  [zoom=8] { text-size: 12; }
  [zoom>8] { text-size: 16; }
  
  text-opacity: 0;
  text-placement-type: simple;
  text-placements: "S,N,E,W,NE,SE,NW,SW,16,14,12";
  text-placement: line;      
  text-dy: 5;
  text-spacing:450;
  text-upright: left;
  
  [dd = 0]                { line-width: 1; text-opacity: 1; }
  [dd =~ "-*30"]          { line-width: 1; text-opacity: 1; }
  [dd =~ "-*60"]          { line-width: 1; text-opacity: 1; }
  [dd =~ "-*90"]          { line-width: 1; text-opacity: 1; }
  [dd =~ "-*120"]         { line-width: 1; text-opacity: 1; }
  [dd =~ "-*150"]         { line-width: 1; text-opacity: 1; }
  [dd =~ "-*180"]         { line-width: 1; text-opacity: 1; }
  [zoom > 3][dd =~ ".*0"] { line-width: 1; text-opacity: 1; }
  [zoom > 4][dd =~ ".*5"] { line-width: 1; text-opacity: 1; }
  [zoom > 7]              { line-width: 1; text-opacity: 1; }
}

.contours {
  line-width: .5;
  line-color: #777;
  line-opacity: 0.3;
  [elev =~ ".*000"] { line-color: #555; line-opacity: 0.7; }

  text-face-name:@futura_med;
  text-name:[elev];
  text-size: 8;
  text-fill: #555;
  text-placement: line;
  text-spacing: 500;
  
  [zoom <= 5] { line-opacity: 0; }
  [zoom <= 6] {
    text-opacity: 0;
  }
}
#15-H-contours-600m [zoom > 9] { line-opacity: 0; text-opacity: 0; }
#15-H-contours-100m [zoom <= 9] { line-opacity: 0; text-opacity: 0; }


.terrain {
  [zoom >= 10] { raster-opacity: 0.6; }
  [zoom = 9] { raster-opacity: 0.65; }
  [zoom = 8] { raster-opacity: 0.7; }
  [zoom <= 7] { raster-opacity: 0.7; }
  
  raster-scaling: lanczos;
  raster-colorizer-default-mode: discrete;
  raster-colorizer-default-color: transparent;
  raster-colorizer-stops:
    stop(0,    @terrain_0),
    stop(1,    @terrain_1),
    stop(600,  @terrain_2),
    stop(1200, @terrain_3),
    stop(1800, @terrain_4),
    stop(2400, @terrain_5),
    stop(3000, @terrain_6);
}

.faa {
  raster-scaling: lanczos;
  
  [zoom <= 5] { raster-opacity: 0; }
  [zoom > 5] { raster-opacity: 0.25; }
  [zoom > 6] { raster-opacity: 0.5; }
  [zoom > 7] { raster-opacity: 1; }
}
