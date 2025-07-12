%{
Coarse-grains a time series using the Bandt-Pompe method
outputs a symbolic sequence of rank vectors (cell array)
example rank vector symbol: '[1;3;2;0]'

inputs: time series (a vector), embedding parameters D and tau
Taken's theorem: D is embedding dimension, tau is embedding delay
%}

function cell_array = bp_perm(t_series,D,tau)

  %%initialize embedding matrix, rank matrix, and cell array of symbols
  n_rows = D;
  n_columns = length(t_series) - tau*(D-1);
  embed_mat = zeros([n_rows,n_columns]);
  rank_matrix = zeros([n_rows,n_columns]);
  cell_array = cell(1,n_columns);

  %%EMBEDDING MATRIX
  %{
    embedding matrix rows contain the time series at different delays
    1st row is the time series (no delay)
    2nd row is the time series starting at 1*tau
    3rd row is the time series starting at 2*tau
    D is the number of rows 
  %}
  for i=1:D
    %delayed time series index range
    tau_offset = (i-1)*tau;
    series_start = 1 + tau_offset;
    series_end = tau_offset + n_columns;

    %slice the time series from range determined above, then add to matrix
    current_row = t_series(series_start:series_end);
    embed_mat(i,:) = current_row;
  end

  %%RANK MATRIX
  %{
    embedding matrix columns are converted to rank vectors
    example: [-5.3;4.1;0.2] becomes [0;2;1]
        0 corresponds to the lowest value in the column (-5.3)
        2 corresponds to the highest value in the column (4.1)
        1 corresponds ot the middle value in the column (0.2)
    column-by-column, we generate a new matrix of these rankings
  %}
  for m=1:n_columns

    %the selected column and initialized rank (permutation) vector
    series_vect = embed_mat(:,m);
    perm_vect = zeros([n_rows,1]);
    
    %compare values in the selected column to create rank vector 
    for i=1:D
      %{
      comp_count increases by 1 if the current element > a neighbor element
      check all neighbors, then move to the next element in the column
      %}
      comp_count = 0;
      current_element = series_vect(i,:);
      for j=1:D
        neighbor_element = series_vect(j,:);
        if current_element>neighbor_element
          comp_count = comp_count + 1;
        end

      end
      perm_vect(i,:) = comp_count; %assign rank values to the rank vector
    end

    %insert the rank vector into a matrix column, then move to next column
    rank_matrix(:,m) = perm_vect; 

    %turn rank vector into a string
    perm_str = mat2str(perm_vect);

    %insert this string into the cell array
    %then return the cell array of symbols
    cell_array{m} = perm_str;

  end

  %%optional plot: occurrence of each ranking in the cell array
  rank_cat = categorical(cell_array);
  histogram(rank_cat);
  xlabel('Rank Vector');
  ylabel('Number of Occurrences');
  title('Rank Vectors Present in a Time Series');

end