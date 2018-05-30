dataset = csvread ('../workfiles/global_last10years.csv', 1, 0); % loads csv data
corrcoef(dataset)
min(min(corrcoef(dataset))) %= 0.588568377562657 between usip and udip
