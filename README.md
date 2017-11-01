# Wireless_Communication_System-HW1-ErlangB_formula
Implement the Erlang-B formula, and calculate the total offered traffic load for the following system parameters:
– Channel number: 1\~20, 200\~220
– Blocking rate: 1%, 3%, 5%, 10%

## Implementation
There are two phases for this project. </br>
In first phase, I use the Erlang-B formula on lecture handout directly. This formula is shown as following, and I implement this in  **erlangB.m** </br>
$$ B(\rho, m)=\frac{\rho ^m}{m!\sum_{k=0}^{m}\frac{\rho ^k}{k!}} $$
I used Newton's method to derive total offered traffic, and I implemented it in **erlangRho.m**. **Newton's method** is a numerical method to approximate the roots. The algorithm will be shown in the following equations: </br>
$$ y=f'(x_n)(x_{n+1}-x_n)+f(x_n) $$
In the above equation, there is derivative of Erlang-B formula $f'(x_n)$, so I implement this in **erlangBdiff.m**. Run Newton's method equation iteratively and then we can get total offered traffic $\rho$.  However, when channel number is over 200, the factorial will be super large and overflow. </br> </br>
In Second phase, I rewrite the Erlang-B formula to deal with factorial problem. The new equation will be shown as follows: </br>
$$ B(\rho, m)=\frac{\rho ^m}{m!\sum_{k=0}^{m}\frac{\rho ^k}{k!}}=\frac{1}{\sum_{k=0}^{m}\frac{m!}{k!}(\frac{1}{\rho})^{m-k}}=\frac{1}{\sum_{k=0}^{m}\frac{m}{\rho}\frac{m-1}{\rho}...\frac{k+1}{\rho}} $$
By equation above, we won't encounter super large factorial anymore. I implement this equation in **largeErlangB.m** and derivative of the equation in **largeErlangBdiff.m** files. And then I implemented Newton's method in **largeErlangRho.m**, which is the same as **erlangRho.m** basically, but just use new function in **largeErlangBdiff.m** and **largeErlangBdiff.m**. </br>
At last, in **main.m**, we run all required system parameters to derive the total offered traffic and plot the line chart.

## Result
| | 1\% | 3\% | 5\% | 10\% | | 1\% | 3\% | 5\% | 10\% |
|  | ----| --- | --- | --- | --- | --- | --- | --- | ---|
|1 | 0.0101 | 0.0309 | 0.0526 |0.1111|200 |179.7381|190.8859 | 198.5073 |214.3226 |
|2 | 0.1526 | 0.2816 | 0.3813 |0.5954|201 |180.7059|191.8943 | 199.5456 |215.4278 |
|3 | 0.4555 | 0.7151 | 0.8994 |1.2708|202 |181.6739|192.9028 | 200.5840 |216.5331 |
|4 | 0.8694 | 1.2589 | 1.5246 |2.0454|203 |182.642|193.9114 | 201.6224 |217.6383 |
|5 | 1.3608 | 1.8752 | 2.2185 |2.8811|204 |183.6103|194.9201 | 202.6609 |218.8437 | 
|6 | 1.9091 | 2.5431 | 2.9603 |3.7584|205 |184.5788|195.9289 | 203.6994 |219.849 |
|7 | 2.5009 | 3.2497 | 3.7378 |4.662|206 |185.5474|196.9378 | 204.7381|220.9544 |
|8 | 3.1276 | 3.9865 | 4.543 |5.5971|207 |186.5161|197.9468 | 205.7768 |222.0598 |
|9 | 3.7825 | 4.7479 | 5.3702 |6.5464|208 |187.4850|198.9559 | 206.8156 |223.1653 |
|10 | 4.4612 | 5.5294 | 6.2157 |7.5106|209 |188.4540|199.9651 | 207.8544 |224.2708 |
|11 | 5.1599 | 6.3280 | 7.0764 |8.4871|210 |189.4232|200.9744 | 208.8933 |225.3763 |
|12 | 5.876 | 7.1410 | 7.9501 |9.474|211 |190.3925|201.9838 | 209.9323 |226.4818 |
|13 | 6.6072 | 7.9667 | 8.8349 |10.4699|212 |191.362|202.9932 | 210.9714 |227.5874| 
|14 | 7.3517 | 8.8035 | 9.7295 |11.4735|213 |192.3316|204.0028 | 212.0105 |228.6931| 
|15 | 8.108 | 9.65 | 10.6327 | 12.4838|214 |193.3013|205.0124 | 213.0497 |229.7987|
|16 | 8.875 | 10.5052 | 11.5436 |13.5001|215 |194.2712|206.0222 | 214.0889 |230.9044| 
|17 | 9.6516 | 11.3683 | 12.4613 |14.5217|216 |195.2412|207.032 | 215.1283 |232.0102|
|18 | 10.4369 | 12.2384 | 13.3852 |15.548|217 |196.2114|208.0419 | 216.1676|233.1159 |
|19 | 11.2301 | 13.115 | 14.3147 |16.5787|218 |197.1817|209.0519 | 217.2071|234.2217 |
|20 | 12.0306 | 13.9974 | 15.2493 |17.6132|219 |198.1521|210.062 | 218.2466|235.3275 |
|   |         |      |    |    |220 | 199.1226 |211.0722|219.2862 |236.4334 |
