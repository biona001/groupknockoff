# Simple app to solve group knockoff optimization

This is an experimental repository that provides a relocatable "app" for code written in Julia. We use [PackageCompiler.jl](https://github.com/JuliaLang/PackageCompiler.jl) to wrap a simple routine that solves the [group knockoff optimization problem](https://arxiv.org/abs/2310.15069).

## Download

First, git clone the repository 
```
git clone https://github.com/biona001/groupknockoff
```
Then, unzip the `app_XXX.zip` file where `XXX` matches your operating system (currently only apple silicon and linux x86 is supported)
```
cd groupknockoff
unzip app_apple_silicon.zip
```
The executable will be located in `app_XXX/bin/groupknockoff`. 

## Usage & example

```
groupknockoff sigma.txt m
```
where 
+ `sigma.txt` is a plain text file containing the correlation matrix stored in tab-separated format. There should be no header
+ `m`: Number of knockoffs the analyst wishes to generate, which defines the constraits in the optimization problem.

**Example (using data under `src`):** Expected output should be
```
$ pwd
/Users/biona001/.julia/dev/groupknockoff/data
$ ../app_apple_silicon/bin/groupknockoff sigma.txt 5
203 representatives for 430 variables, 241 optimization variables
Maxent initial obj = -3976.639913431866
Iter 1 (PCA): obj = -3272.9160443188894, δ = 0.5307152346716336, t1 = 0.01, t2 = 0.0
Iter 2 (CCD): obj = -2668.3862564376786, δ = 0.5932619592923948, t1 = 0.01, t2 = 0.01, t3 = 0.0
Iter 3 (PCA): obj = -2398.5378619681787, δ = 0.3873740427258285, t1 = 0.03, t2 = 0.01
Iter 4 (CCD): obj = -2239.4242488789246, δ = 0.3058039465734939, t1 = 0.03, t2 = 0.01, t3 = 0.0
Iter 5 (PCA): obj = -2137.345534062957, δ = 0.22679100360241075, t1 = 0.04, t2 = 0.02
Iter 6 (CCD): obj = -2107.4623405785032, δ = 0.2593014348969042, t1 = 0.04, t2 = 0.02, t3 = 0.0
Iter 7 (PCA): obj = -2069.4601001286233, δ = 0.12449914101196095, t1 = 0.05, t2 = 0.02
Iter 8 (CCD): obj = -2068.2089269896646, δ = 0.023272211430398024, t1 = 0.05, t2 = 0.03, t3 = 0.0
Iter 9 (PCA): obj = -2050.1590796498435, δ = 0.06221588512243029, t1 = 0.06, t2 = 0.03
Iter 10 (CCD): obj = -2049.1320452314144, δ = 0.021322296710926156, t1 = 0.06, t2 = 0.03, t3 = 0.0
Iter 11 (PCA): obj = -2038.3564136916027, δ = 0.06800904635159992, t1 = 0.08, t2 = 0.04
Iter 12 (CCD): obj = -2037.5314788114642, δ = 0.018412342893657115, t1 = 0.08, t2 = 0.04, t3 = 0.0
Iter 13 (PCA): obj = -2030.4149756595025, δ = 0.0531219671577248, t1 = 0.09, t2 = 0.05
Iter 14 (CCD): obj = -2029.7407140011135, δ = 0.015709132089124465, t1 = 0.09, t2 = 0.05, t3 = 0.0
Iter 15 (PCA): obj = -2024.5077557515956, δ = 0.06285340531750039, t1 = 0.1, t2 = 0.05
Iter 16 (CCD): obj = -2023.9459179850119, δ = 0.013101848749280543, t1 = 0.1, t2 = 0.05, t3 = 0.0
Iter 17 (PCA): obj = -2020.2536464440443, δ = 0.05970081849925719, t1 = 0.11, t2 = 0.06
Iter 18 (CCD): obj = -2019.8086631464043, δ = 0.00969890773472233, t1 = 0.11, t2 = 0.06, t3 = 0.0
Iter 19 (PCA): obj = -2017.1739529896302, δ = 0.034077311847352285, t1 = 0.12, t2 = 0.07
Iter 20 (CCD): obj = -2016.8627869251097, δ = 0.00811031513217606, t1 = 0.12, t2 = 0.07, t3 = 0.0
Iter 21 (PCA): obj = -2014.952457640997, δ = 0.02124631817294009, t1 = 0.13, t2 = 0.07
Iter 22 (CCD): obj = -2014.7711068922192, δ = 0.006852024230133178, t1 = 0.13, t2 = 0.07, t3 = 0.0
Iter 23 (PCA): obj = -2013.364499694923, δ = 0.01751278984407493, t1 = 0.14, t2 = 0.08
Iter 24 (CCD): obj = -2013.272116827203, δ = 0.00519505106419929, t1 = 0.14, t2 = 0.08, t3 = 0.0
Iter 25 (PCA): obj = -2012.2203135135917, δ = 0.01437710510110799, t1 = 0.16, t2 = 0.08
Iter 26 (CCD): obj = -2012.1665535491047, δ = 0.004311814579175299, t1 = 0.16, t2 = 0.09, t3 = 0.0
Iter 27 (PCA): obj = -2011.36065251226, δ = 0.013030483825913913, t1 = 0.17, t2 = 0.09
Iter 28 (CCD): obj = -2011.316241839796, δ = 0.004758224953293359, t1 = 0.17, t2 = 0.09, t3 = 0.0
Iter 29 (PCA): obj = -2010.6755812994675, δ = 0.012214869142719695, t1 = 0.18, t2 = 0.1
Iter 30 (CCD): obj = -2010.6304555381325, δ = 0.004699471885352681, t1 = 0.18, t2 = 0.1, t3 = 0.0
Iter 31 (PCA): obj = -2010.109003953247, δ = 0.011148466459874582, t1 = 0.19, t2 = 0.1
Iter 32 (CCD): obj = -2010.0630546152177, δ = 0.00434898367479869, t1 = 0.19, t2 = 0.11, t3 = 0.0
Iter 33 (PCA): obj = -2009.6396046854584, δ = 0.01176846059487951, t1 = 0.2, t2 = 0.11
Iter 34 (CCD): obj = -2009.5962123610066, δ = 0.0038403412033047846, t1 = 0.2, t2 = 0.11, t3 = 0.0
Iter 35 (PCA): obj = -2009.2580842715777, δ = 0.012349439636019931, t1 = 0.21, t2 = 0.12
Iter 36 (CCD): obj = -2009.220633510039, δ = 0.0032346781662313568, t1 = 0.21, t2 = 0.12, t3 = 0.0
Iter 37 (PCA): obj = -2008.9541714574673, δ = 0.011727588403854147, t1 = 0.22, t2 = 0.12
Iter 38 (CCD): obj = -2008.924647098155, δ = 0.002627646781621286, t1 = 0.22, t2 = 0.13, t3 = 0.0
Iter 39 (PCA): obj = -2008.715928586504, δ = 0.010373748213955905, t1 = 0.23, t2 = 0.13
Iter 40 (CCD): obj = -2008.6945814066446, δ = 0.0020566202195789894, t1 = 0.23, t2 = 0.13, t3 = 0.0
Iter 41 (PCA): obj = -2008.5311682808392, δ = 0.00866690367411388, t1 = 0.24, t2 = 0.14
Iter 42 (CCD): obj = -2008.5170453209819, δ = 0.0015646879963359072, t1 = 0.24, t2 = 0.14, t3 = 0.0
```

**Output**

+ `S.txt`: The full $p \times p$ matrix `S` satisfying $\frac{m+1}{m}\Sigma - S \succeq 0$ (but it is no longer strictly block-diagonal due to utilization of conditional independence)
+ `S11.txt`: The output of group knockoff optimization applied on the group-key variables. 
+ `groups.txt`: Vector of group membership
+ `group_reps.txt`: Selected representatives (i.e. group-key variables)

## What problem is the app solving

We solve the following problem for `S` (a block-diagonal matrix where the blocks corresponds to groups)
```math
\max_{\mathbf{S}} \log\det\left(\frac{m+1}{m}\mathbf{\Sigma} - \mathbf{S}\right) + m \log\det(\mathbf{S})     \quad \text{ subject to } 
    \begin{cases}
        \frac{m + 1}{m}\mathbf{\Sigma} - \mathbf{S} \succeq 0\\
        \mathbf{S} \succeq 0
    \end{cases}
```
where $m$ and $\Sigma$ are given. In this app, we define groups via average-linkage hierarchical clustering, choose group-key variables with threshold $c=0.5$, and use the maximum entropy (ME) solver. These parameters give a pretty good balance in terms of speed and power/FDR control. See [our paper](https://arxiv.org/abs/2310.15069) for more details.

## Compiling the app from scratch

In case you would like to compile the app yourself, first install [PackageCompiler.jl](https://github.com/JuliaLang/PackageCompiler.jl), and within Julia,
```julia
using PackageCompiler
src = "/Users/biona001/.julia/dev/groupknockoff"
des = "/Users/biona001/.julia/dev/groupknockoff/app_apple_silicon"
@time create_app(src, des, include_lazy_artifacts=true)
```
