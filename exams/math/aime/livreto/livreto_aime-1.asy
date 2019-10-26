if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="livreto_aime-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(3cm);
pair A=(0.05,0),B=(-.9,-0.6),C=(0,-0.45),D=(.9,-0.6),E=(.55,-0.85),F=(-0.55,-0.85),G=B-(0,1.1),H=F-(0,0.6),I=E-(0,0.6),J=D-(0,1.1),K=C-(0,1.4),L=C+K-A;
draw(A--B--F--E--D--A--E--A--F--A^^B--G--F--K--G--L--J--K--E--J--D--J--L--K);
draw(B--C--D--C--A--C--H--I--C--H--G--H--L--I--J--I--D^^H--B,dashed);
dot(A^^B^^C^^D^^E^^F^^G^^H^^I^^J^^K^^L);
