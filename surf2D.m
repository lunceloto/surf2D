function surf2D(x, y, z)
    % SURFER 绘制非均匀散点数据的等值线图
    %
    % 输入参数：
    %   x, y, z: 数据点的坐标和值向量
    %   gridResolution: 网格分辨率（默认100）
    %   interpolationMethod: 插值方法（默认'v4'）
    %
    % 示例：
    %   surfer(x, y, z)
    %   surfer(x, y, z, 200, 'cubic')
    
    % 参数检查和默认值设置
    if nargin < 5
        interpolationMethod = 'v4'; % 默认使用v4插值
    end
    if nargin < 4
        gridResolution = 100; % 默认网格分辨率
    end
    
    % 数据验证
    if ~isequal(size(x), size(y), size(z))
        error('输入向量 x, y, z 必须具有相同的大小');
    end
    
    % 确定数据范围
    xlims = [min(x), max(x)];
    ylims = [min(y), max(y)];
    
    % 创建规则网格 - 简化代码
    xi = linspace(xlims(1), xlims(2), gridResolution);
    yi = linspace(ylims(1), ylims(2), gridResolution);
    [XI, YI] = meshgrid(xi, yi);
    
    % 插值到规则网格
    ZI = griddata(x, y, z, XI, YI, interpolationMethod);
    
    % 绘制等值线图
    figure;
    contourf(XI, YI, ZI, 20, 'LineStyle', 'none');
    colormap(jet);
    % 设置坐标轴范围以匹配数据范围
    axis([xlims, ylims]);
    
end