function getRetinalClass_CnnSvm(varargin)
%% Image Loading
try 
    inputImgName = varargin{1};
    [~,name,ext] = fileparts(inputImgName);
    im = imread(inputImgName) ;
catch
    disp('Error in input: image path');
    return;
end
disp(['Input image : ' name]);
%%
imType = {'Normal' , 'Exudates' , 'Drusen'};

%% Network Configuration
run vl_setupnn;
opts.modelType = 'imagenet-googlenet-dag';
net = load(['models/' opts.modelType '.mat']);
normalization = net.meta.normalization;
net = dagnn.DagNN.loadobj(net);
net.conserveMemory = false;
dag = true;
%% Data Pre-processing
im = imresize(im, normalization.imageSize(1:2), 'bilinear') ;
%% CNN Feature Extraction using GoogleLeNet Model
disp(['CNN Feature Extraction']);
im_ = single(im); 
for i=1:size(im_,3)
    if(size(normalization.averageImage,3)>1)
        im_(:,:,i) = im_(:,:,i) - normalization.averageImage(:,:,i) ;
    else
        im_(:,:,i) = im_(:,:,i) - normalization.averageImage(i) ;
    end
end
net.eval({'data',im_}) ;
cnnFeatures = squeeze(gather(net.vars(end-2).value));
cnnFeatures = cnnFeatures / norm(cnnFeatures);
%% Loading Pre-trained SVM model (RBF Kernel)
load('./models/SVM_model.mat');
%% SVM Prediction on CNN features
disp('SVM Prediction');
[predictedLabel, ~, ~] = svmpredict(3.0,double(cnnFeatures)',model,'-q');
%% Code Output
disp(['Class of ' name ' = ' imType{predictedLabel}]);
