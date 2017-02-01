naam=input('Enter your name: ','s')
mkdir('Database',naam);
b='D:\Face Final\Database\';
b1=strcat(b,naam,'\');
fac = vision.CascadeObjectDetector;

for i=1:10
    cam = webcam(1)  
    cam.Resolution = '1280x720';
    preview(cam);
    temp = snapshot(cam);                           
    clear cam  
    b2=strcat(b1,num2str(i),'.jpeg');
    bboxes = step(fac,temp);                
    crop = imcrop(temp,bboxes);    
    gray1=rgb2gray(crop);
    resized=imresize(gray1,[150 150]);
    imwrite(resized,b2);
end
