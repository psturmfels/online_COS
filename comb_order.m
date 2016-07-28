function index = comb_order(combination, n, k)
% Given a k-combination 'combination 'of [n], 
% returns the index of combination within nchoosek(n, k);

index = 1;
j = 0;
for i = 1:k
    j = j + 1;
    while j ~= combination(i)
        index = index + nchoosek(n - j, k - i);
        j = j + 1;
    end
end
end