import 'common.dart';
import '../highlight.dart';

var rsl = Mode(
    refs: {},
    keywords: {
      "keyword":
          "float color point normal vector matrix while for if do return else break extern continue",
      "built_in":
          "abs acos ambient area asin atan atmosphere attribute calculatenormal ceil cellnoise clamp comp concat cos degrees depth Deriv diffuse distance Du Dv environment exp faceforward filterstep floor format fresnel incident length lightsource log match max min mod noise normalize ntransform opposite option phong pnoise pow printf ptlined radians random reflect refract renderinfo round setcomp setxcomp setycomp setzcomp shadow sign sin smoothstep specular specularbrdf spline sqrt step tan texture textureinfo trace transform vtransform xcomp ycomp zcomp"
    },
    illegal: "</",
    contains: [
      C_LINE_COMMENT_MODE,
      C_BLOCK_COMMENT_MODE,
      QUOTE_STRING_MODE,
      APOS_STRING_MODE,
      C_NUMBER_MODE,
      Mode(className: "meta", begin: "#", end: "\$"),
      Mode(
          className: "class",
          beginKeywords: "surface displacement light volume imager",
          end: "\\("),
      Mode(beginKeywords: "illuminate illuminance gather", end: "\\(")
    ]);
