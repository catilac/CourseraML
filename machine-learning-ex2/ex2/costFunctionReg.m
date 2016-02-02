function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta); % number of features

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


Xtheta = X * theta;
for i = 1:m,
  z = Xtheta(i);
  J += -y(i) * log(sigmoid(z)) - (1 - y(i)) * log(1 - sigmoid(z));
end
J /= m;

% regularize cost function
regParam = 0;
for i = 2:n,
  regParam += theta(i)^2;
end
J += regParam * lambda/(2*m);

grad = sum((sigmoid(Xtheta) - y) .* X)';
grad /= m;

% regularize gradient
grad(2:n, :) += (lambda/m)*theta(2:n, :);



% =============================================================

end
