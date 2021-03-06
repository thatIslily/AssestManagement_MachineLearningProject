% READ THE DATA
m = readtable('regress_example.xlsx');

%TRANSFORM THE DATA FROM COUMPOUNDING TO DAILY RATE
nrow = height (m);
for i = 1:nrow-1
    m.new_diff(i)=((m.JSEZAR(i+1)+1)/(m.JSEZAR(i)+1))-1;
end

m(1,:)=[];

%EXAMINE THE DISTRIBUTION
hist(m.JSEZAR,100);

%CREATE CATEGORIES & TRANSFORM DATA FROM REGRESSION TO CLASSIFICATION
m.cat = repmat({''},size(m.JSEZAR));
[m.cat(m.JSEZAR>.2)]=deal({'win'});
[m.cat(m.JSEZAR<-.2)]=deal({'loss'});
m.cat=categorical(m.cat);
 
m.JSEZAR = []

writetable(m,'transform_regress_example_test.xlsx')

