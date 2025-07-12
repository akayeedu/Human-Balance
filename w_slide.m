%{
Determines the Lempel-Ziv Complexity for various windows of
the time series (using Bandt-Pompe coarse-graining).

Inputs are the time series t_series, embedding parameters D and tau, and
window parameters w_size (number of samples in the window) and w_overlap
(percentage of overlap between successive windows, 0-99).

Creates a time-evolution plot of complexity through windows and a histogram
detailing how often a certain complexity value occurred when sliding the
window through the time series.
%}

function window_values = w_slide(t_series,D,tau,w_size,w_overlap)

  %how much to shift each window
  shift_value = int16(floor(((100-w_overlap)/100)*w_size));

  %starting window
  w_start = 1;
  w_end = w_size;

  %accumulate LZC for each window
  lzc_values = [];

  while w_end < length(t_series)

    %current window of time series
    win_select = t_series(w_start:w_end);

    %coarse grain the window according to D and tau
    cg_win = bp_perm(win_select,D,tau);

    %find the lz complexity from the coarse grained sequence
    lz_win = lzcell(cg_win);

    %add to the list of lzc values
    lzc_values = [lzc_values,lz_win];

    %move the window and compute agian
    w_start = w_start + shift_value;
    w_end = w_end + shift_value;

  end
  window_values = lzc_values;

  figure(1);
  %time evolution plot
  plot(window_values);
  xlabel('Window Number');
  ylabel('Lempel-Ziv Complexity');
  title('LZC Evolution from Sliding Windows');

  %histogram
  figure(2);
  as_cat = categorical(window_values);
  histogram(as_cat);
  xlabel('Lempel-Ziv Complexity');
  ylabel('Number of Windows');
  title('LZC Occurrences from Sliding Windows');
end