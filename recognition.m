faces = imageSet('Database','recursive');
cam = webcam(1)          
cam.Resolution = '1280x720';
preview(cam);
ii = snapshot(cam);
clear cam     
imwrite(ii,'D:\Face Final\test.jpeg');
image = imread('test.jpeg');                      
facedetector = vision.CascadeObjectDetector;   
bboxes = step(facedetector, image);                
inpu = imcrop(image,bboxes);           
gray = rgb2gray(inpu);
input = imresize(gray,[150 150]);
point = detectSURFFeatures(input);                                               
[infeat, vp]= extractFeatures(input,point);   
features = bagOfFeatures(faces);
for i= 1:2
    ml = trainImageCategoryClassifier(faces,features);    
end
acc = evaluate(ml,faces);
accuracy = mean(diag(acc));
[labelIdx, scores] = predict(ml,input);
if accuracy > 0.2
output = ml.Labels(labelIdx)  
else 
    disp('You are intruder')
end

    



    




