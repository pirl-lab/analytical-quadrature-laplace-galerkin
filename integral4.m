function q = integral4(f,varargin)
% integral4(f) = integral2(integral2(f)).
narginchk(9,inf);
zmin = varargin{5};
zmax = varargin{6};
wmin = varargin{7};
wmax = varargin{8};
anyisinf = false;
if ~isa(zmin,'function_handle')
    anyisinf = anyisinf || isinf(zmin(1));
    zmin = @(x,y)zmin(1)*ones(size(x));
end
if ~isa(zmax,'function_handle')
    anyisinf = anyisinf || isinf(zmax(1));
    zmax = @(x,y)zmax(1)*ones(size(x));
end
if ~isa(wmin,'function_handle')
    anyisinf = anyisinf || isinf(wmin(1));
    wmin = @(x,y,z)wmin(1)*ones(size(x));
end
if ~isa(wmax,'function_handle')
    anyisinf = anyisinf || isinf(wmax(1));
    wmax = @(x,y,z)wmax(1)*ones(size(x));
end
if anyisinf
    method_override = {'method','iterated'};
else
    method_override = {};
end
inner = @(x,y)integral2( ...
    @(z,w)f(x*ones(size(z)),y*ones(size(z)),z,w), ...
    zmin(x,y), ...
    zmax(x,y), ...
    @(z)wmin(x*ones(size(z)),y*ones(size(z)),z), ...
    @(z)wmax(x*ones(size(z)),y*ones(size(z)),z), ...
    varargin{9:end},method_override{:});
q = integral2( ...
    @(xv,yv)arrayfun(inner,xv,yv), ...
    varargin{1:4},varargin{9:end});