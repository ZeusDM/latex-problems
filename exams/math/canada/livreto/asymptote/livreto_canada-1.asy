if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="livreto_canada-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import olympiad;
import cse;

defaultpen(fontsize(10pt));
size(8cm); // set a reasonable default
usepackage("amsmath");
usepackage("amssymb");
settings.tex="pdflatex";
settings.outformat="pdf";

import olympiad;
import cse;

unitsize(3mm);

defaultpen(white);

fill(scale(9)*unitsquare,black);

fill(shift(1,0)*unitsquare);

fill(shift(3,0)*unitsquare);

fill(shift(5,0)*unitsquare);

fill(shift(7,0)*unitsquare);



fill(shift(0,1)*unitsquare);

fill(shift(2,1)*unitsquare);

fill(shift(4,1)*unitsquare);

fill(shift(6,1)*unitsquare);

fill(shift(8,1)*unitsquare);



fill(shift(1,2)*unitsquare);

fill(shift(3,2)*unitsquare);

fill(shift(5,2)*unitsquare);

fill(shift(7,2)*unitsquare);



fill(shift(0,3)*unitsquare);

fill(shift(2,3)*unitsquare);

fill(shift(4,3)*unitsquare);

fill(shift(6,3)*unitsquare);

fill(shift(8,3)*unitsquare);



fill(shift(1,4)*unitsquare);

fill(shift(3,4)*unitsquare);

fill(shift(5,4)*unitsquare);

fill(shift(7,4)*unitsquare);



fill(shift(0,5)*unitsquare);

fill(shift(2,5)*unitsquare);

fill(shift(4,5)*unitsquare);

fill(shift(6,5)*unitsquare);

fill(shift(8,5)*unitsquare);



fill(shift(1,6)*unitsquare);

fill(shift(3,6)*unitsquare);

fill(shift(5,6)*unitsquare);

fill(shift(7,6)*unitsquare);



fill(shift(0,7)*unitsquare);

fill(shift(2,7)*unitsquare);

fill(shift(4,7)*unitsquare);

fill(shift(6,7)*unitsquare);

fill(shift(8,7)*unitsquare);



fill(shift(1,8)*unitsquare);

fill(shift(3,8)*unitsquare);

fill(shift(5,8)*unitsquare);

fill(shift(7,8)*unitsquare);



draw(scale(9)*unitsquare,black);
