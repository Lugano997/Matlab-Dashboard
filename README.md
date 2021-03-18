# Matlab-Dashboard by The Black Swan Team

Welcome to The Black Swan Risk Management Dashboard for Options Market Making Desk. Matlab Version R2020a


1. Introduction

The Dashboard allow the user to build portfolios composed by different typology of options with the main exchange rates as underlying. In the first page it is possible to have a first view about relevant data obtained by the constructed portfolios.

The second page allows the user to visualize the portfolio built in the first page. Moreover, it is available a chart supported by graph, showing the portfolio performances divided by currencies.
 
In the third page, the user will be allowed to observe and analyze different statistic data on the available underlying.

In the fourth page the user will be able to perform a scenario analysis on the just built or pre-saved portfolio, allowing him/her to evaluate the position risks.




2. In-depth functions explanation

a) Portfolios Creation

The first page allows the user to create options portfolio with the most common exchange rates as underlying.

The user has to manually insert the relevant information to enable the pricing and registration of instruments and transactions.

Firstly, the user will specify the settle date as the portfolio creation or transaction registration day in the Set Dates and Rates menu. Subsequently, it is needed to upload the breakeven rates for the contract (risk free rate) and then set the related currency. It is possible for the user to create a term structure based on the uploaded rates. Once the data have been registered, the user will be allowed to return to the control panel and insert the sensible data for the portfolio construction. The user can create portfolio composed by the main options typologies, in both positions long or short. The portfolio value is given by the sum of all the single options prices evaluated using Black&Scholes formula. Only for American and Lookback options the team has considered the Montecarlo Simulation approach as more adequate for the pricing and for this reason the user will have to select the number of simulations to use.  

Once all the data are set, the user could intialize the portfolio or the related transactions. As the user press the "Add Instrument/Transaction", the chart below will show the pre-registration data about the portfolio. To remove the last transaction if incorrect the user has to press the "Undo" button.

Once that a control check has been done, the portfolio will be saved clicking on the "Register Instruments/Transactions" button. All the relevant data of the confirmed portfolio will be shown in the second page.

b) Desk Performance

In the second page the user will be able to visualize the relevant information on the portfolios registered in page 1.

Once that the user has clicked on the upload data button, the output will be shown in the charts below.

In the first chart are stored the main information about the portfolio, as the Start Date, the net Long/Short position and portfolio composition. 
In the second chart is shown a simplified cash flow analysis, which register all the inflows and outflows of the portfolio.

The 2 graphs below will show the time series of the portfolio value and of the inflows and outflows.


c) Time Series Analysis.

In the third page the user will be able to perform a statistical analysis on the exchange rate relevant characteristics used as underlying.

The analysis is performed through three easy to understand control panels.

The first one allows the user to select up to 2 exchange rate time series of his/her own choice over a modulable time span. The time series selected will be shown in the graph below the panel control.

Using the second control panel, the user can perform an analysis on the main descriptive statistics on all the time series available. In addition, the panel activation will generate a correlation map graph, created on all the exchange rates available, which allow the user to have a sight of how they co-variate.

The third control panel enable the user to visualize the selected time series distribution through a histogram and to compare it with the main distributions linked to the exchange rates time series.

d) VaR calculation and Backtesting

In the fourth page it is possible to perform a scenario analysis on the built by the user portfolios.

Firstly, the user has to select the underlying exchange rate because the analysis is performed on portfolios divided for currency.

The Stepladder analysis is a scenario-driven test based on the returns associated to the distribution quantiles of the underlying. It informs the user about how much the portfolio will gain/lose in different statistical relevant scenarios. 

To perform the analysis the user has to select a sampling period which defines how many historical data he/her want to include in the scenario computation. Subsequently, selecting the Risk Horizon, the user will be able to choose how many days ahead the anlaysis is referred. Once all the data have been inserted the user can start the analysis pressing the button. The output are 2 tables. The first is an easy-to-read stepladder table which shows the main portfolio data, as the gains/losses and the greeks in every scenario. The second table sum up the VaR and ES analysis. In particular, it will show the VaR and ES at 3 confidence 
interval for the analyzed portfolio. To avoid model complications, we have used a simplified approach, creating a portfolio returns distribution based on the the exchange rates distribution, which has been supposed to be normal. Then, the VaR and ES have been calculated on the return distribution.

The second function available in page 3 is the Backtesting.

As for the Stepladder, the user has to select a rolling sampling window for the Backtesting calculation on the historical data. In addition, it is required to insert the time horizon on which the Backtesting is done and a maximum VaR threshold created on the user needs.

Once the required data have been inserted and the "Start Backtesting" button is pushed, the user will obtain the analysis results.

In particular, the outputs of our function are the following:

1. A descriptive chart in wich the user could observe the main results of Backtesting (eg. Number of failures, VaR, number of observations, etc.)
2. The first graph shows the time series of the portfolio VaR based on historical data.
3. The second graph show how many times in past the analyzed portfolio would have breached the VaR limit imposed by the user

e) Sensitivity Analysis and Volatilty Surface

In the last page, the user will be able to visualize some fundamental key risk metrics.

The first graph shows the portfolio sensitivity in terms of Gamma and Delta. 

Once that the user has pushed the 'Plot Portfolio Data' button the output will be a 3D graph. On the x-axis it is shown a variety of underlying value, on the y-axis the Time to maturity expressed in days and on the z-axis is shown the Gamma value for the selected portfolio. To analyze the Delta dynamic we have used a colorbar which express low Delta value in blue and high Delta value in yellow.

The second graph is used to take into account a relevant options phenomenon: the volatility smiles.

This is particularly relevant since options on the same underlying but with different strikes, will express different Implied Volatility values.

To run the function the user has to import option data via button. The required data uploadble throug Excel files are:

1. Options prices series
2. Options maturity series
3. Options strikes series
4. Options underlying series

Once the data have been uploaded, the user will be able to generate the graph. The surface has on the x-axis the Moneyness, calculated as underlying divided by the strike. On the y-axis is shown the Time to Maturity in years, and on the z-axis is shown the related Implied Volatility value.


LINK TO REPOSITORY
https://github.com/Lugano997/Matlab-Dashboard/tree/v1.0        
