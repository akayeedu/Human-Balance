%{
Optional program: plots the time series and marks where there was a unit
increase to the Lempel-Ziv complexity. Requires coarse-graining parameters
D and tau and references ex_hist.m to determine locations of the marks.
%}

function break_points = lzc_partition(t_series,D,tau)

    %initialize array of break points
    break_points = zeros(1,length(t_series));
    
    %coarse grain first
    cg_series = bp_perm(t_series,D,tau);

    %find the exhaustive history of the coarse grained series
    ex_cell = ex_hist(cg_series);
    
    break_accumulate = 0;

    %go through each word in the exhaustive history
    for i = 1:length(ex_cell)
        word = ex_cell{i};

        %a triple rank vector [0;1;2] has 7 characters (D=3)
        %a quadruple rank vector [2;0;1;3]' has 9 characters (D=4), etc
        %formula for the number of symbols (rank vectors) in a word:
        word_length = length(word)/((2*D)+1);

        %record index of the time series where a word ended
        break_accumulate = break_accumulate + word_length;

        %graph a spike (1.5x the time series value) at this index
        break_points(break_accumulate) = 1.5*t_series(break_accumulate);
        
    end
    plot(t_series,"r")
    hold on
    plot(break_points,"k")
    hold off
    xlabel('Sample #')
    ylabel('Mass-Normalized Jerk (N/s)')
    title('Exhaustive History Division of Jerk Signal')
end