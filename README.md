# Wireless_Communication_System-HW1-ErlangB_formula
Implement the Erlang-B formula, and calculate the total offered traffic load for the following system parameters:
– Channel number: 1~20, 200~220
– Blocking rate: 1%, 3%, 5%, 10%

## Implementation
There are two phases for this project. </br>
In first phase, I use the Erlang-B formula on lecture handout directly. This formula is shown as following, and I implement this in  **erlangB.m** </br>
$$ B(\rho, m)=\frac{\rho ^m}{m!\sum_{k=0}^{m}\frac{\rho ^k}{k!}} $$
I used Newton's method to derive total offered traffic, and I implemented it in **erlangRho.m**. **Newton's method** is a numerical method to approximate the roots. The algorithm will be shown in the following equations: </br>
$$ y=f'(x_n)(x_{n+1}-x_n)+f(x_n) $$
In the above equation, there is derivative of Erlang-B formula $f'(x_n)$, so I implement this in **erlangBdiff.m**. Run Newton's method equation iteratively and then we can get total offered traffic $\rho$.  However, when channel number is over 200, the factorial will be super large and overflow. </br>
In Second phase, I rewrite the Erlang-B formula to deal with factorial problem. The new equation will be shown as follows: </br>
$$ B(\rho, m)=\frac{\rho ^m}{m!\sum_{k=0}^{m}\frac{\rho ^k}{k!}}=\frac{1}{\sum_{k=0}^{m}\frac{m!}{k!}(\frac{1}{\rho})^{m-k}}=\frac{1}{\sum_{k=0}^{m}\frac{m}{\rho}\frac{m-1}{\rho}...\frac{k+1}{\rho}} $$
By equation above, we won't encounter super large factorial anymore. I implement this equation in **largeErlangB.m** and derivative of the equation in **largeErlangBdiff.m** files. And then I implemented Newton's method in **largeErlangRho.m**, which is the same as **erlangRho.m** basically, but just use new function in **largeErlangBdiff.m** and **largeErlangBdiff.m**. </br>
At last, in **main.m**, we run all required system parameters to derive the total offered traffic and plot the line chart.
