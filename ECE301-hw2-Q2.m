%% ECE301 Hw2 Question 2
%% September 13th 2020
%% Ryan Bride Bradley University Junior Electrical and Computer Engineering.

clc;close all; clear all;
% get the first 11 value of y(n)
len_x = 8; % non-zero data in x(n)
len_y = 11;  %  len_h + len_x - 1

y = zeros(1, len_y); % 


%DFQ 
x = zeros(1,len_y); % 
x(1:len_x) = [1 2 3 4  4 3 2 1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1 : len_y
  if (i == 1) 
      y(i) = 0.25 * x(i);
  elseif (i == 2)
      y(i) = 0.25 * x(i) + 0.5 * x(i-1);
  elseif ( i == 3) 
      y(i) = 0.25 * x(i) + 0.5 * x(i-1) + 0.5 * x(i-2);
  else
      y(i) = 0.25 * x(i) + 0.5 * x(i-1) + 0.5 * x(i-2) + 0.25 * x(i-3);
      
  end
end


%% filter result

h= [ 0.25  0.5  0.5  0.25];

y1 = filter(h,1, x);  % return y with the same length as x


%%%%%% . convolution result

x = zeros(1,len_x); % 
x = [1 2 3 4  4 3 2 1];
temp = conv(h,x); % convolution; return length . =  len_h + len_x -1 


%% to match the same length as y1, y
y2 = zeros(1,len_y);
y2(1: length(temp)) = temp;


n_index = 0: len_y-1;
%%%%%%%%%%%%%%%%%%%%%%%%
figure;
subplot(311);
stem(n_index, y); grid on;
title ('DFQ (for loop) ');
subplot(312);
stem(n_index, y1); grid on;
title ('Filter (call filter)');
subplot(313);
stem(n_index,y2);grid on
title('convolution ( call conv)');