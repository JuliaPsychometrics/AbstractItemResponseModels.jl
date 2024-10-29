import{_ as i,c as a,a5 as e,o as t}from"./chunks/framework.D1iJNzbf.js";const c=JSON.parse('{"title":"AbstractItemResponseModels.jl","description":"","frontmatter":{},"headers":[],"relativePath":"_index.md","filePath":"_index.md","lastUpdated":null}'),n={name:"_index.md"};function l(p,s,h,o,r,d){return t(),a("div",null,s[0]||(s[0]=[e(`<h1 id="abstractitemresponsemodels-jl" tabindex="-1">AbstractItemResponseModels.jl <a class="header-anchor" href="#abstractitemresponsemodels-jl" aria-label="Permalink to &quot;AbstractItemResponseModels.jl&quot;">​</a></h1><p><a href="https://JuliaPsychometrics.github.io/AbstractItemResponseModels.jl/stable/" target="_blank" rel="noreferrer"><img src="https://img.shields.io/badge/docs-stable-blue.svg" alt="Stable"></a> <a href="https://JuliaPsychometrics.github.io/AbstractItemResponseModels.jl/dev/" target="_blank" rel="noreferrer"><img src="https://img.shields.io/badge/docs-dev-blue.svg" alt="Dev"></a> <a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/actions/workflows/CI.yml?query=branch%3Amain" target="_blank" rel="noreferrer"><img src="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/actions/workflows/CI.yml/badge.svg?branch=main" alt="Build Status"></a> <a href="https://codecov.io/gh/JuliaPsychometrics/AbstractItemResponseModels.jl" target="_blank" rel="noreferrer"><img src="https://codecov.io/gh/JuliaPsychometrics/AbstractItemResponseModels.jl/branch/main/graph/badge.svg" alt="Coverage"></a></p><p>This package provides a generic interface for item response models in Julia. It is targeted at developers of item response model packages. Packages sucessfully implementing the AbstractItemResponseModels interface will profit from features within <a href="https://github.com/JuliaPsychometrics/" target="_blank" rel="noreferrer">JuliaPsychometrics</a> such as plotting for their item response models (e.g. via <a href="https://github.com/JuliaPsychometrics/ItemResponsePlots.jl" target="_blank" rel="noreferrer">ItemResponsePlots.jl</a>).</p><h2 id="interface" tabindex="-1">Interface <a class="header-anchor" href="#interface" aria-label="Permalink to &quot;Interface&quot;">​</a></h2><p>Creating a package using AbstractItemResponseModels requires that</p><ol><li><p>AbstractItemResponseModels.jl is added as a package dependency</p></li><li><p>the AbstractItemResponseModels interface is implemented as described below</p></li><li><p>[optional] the interface tested (also described below)</p></li></ol><h3 id="types" tabindex="-1">Types <a class="header-anchor" href="#types" aria-label="Permalink to &quot;Types&quot;">​</a></h3><p>AbstractItemResponseModels offers a single abstract type defining an item response model.</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">abstract type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> ItemResponseModel </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">end</span></span></code></pre></div><p>All concrete implementations of item response models must inherit from this abstract type, e.g.</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">struct</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> MyFancyIRTModel </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;:</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> ItemResponseModel</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> end</span></span></code></pre></div><h3 id="traits" tabindex="-1">Traits <a class="header-anchor" href="#traits" aria-label="Permalink to &quot;Traits&quot;">​</a></h3><p>Item response models have traits attached to them allowing for flexible dispatch. AbstractItemResponseModels defines a total of 4 such traits.</p><h4 id="Response-type" tabindex="-1">Response type <a class="header-anchor" href="#Response-type" aria-label="Permalink to &quot;Response type {#Response-type}&quot;">​</a></h4><p>Each item response model must define its response type. The response type sets the plausible values that the response data can take.</p><p>The available response types are:</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">abstract type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Dichotomous </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;:</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> ResponseType</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> end</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">abstract type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Nominal </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;:</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> ResponseType</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> end</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">abstract type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Ordinal </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;:</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> ResponseType</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> end</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">abstract type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Continuous </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;:</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> ResponseType</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> end</span></span></code></pre></div><p>To define a response type for an item response model, implement the <code>response_type</code> function for your model such as</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;">response_type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">Type{MyFancyIRTModel}</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">) </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Dichotomous</span></span></code></pre></div><h4 id="dimensionality" tabindex="-1">Dimensionality <a class="header-anchor" href="#dimensionality" aria-label="Permalink to &quot;Dimensionality&quot;">​</a></h4><p>An item response model defines the dimensionality of both item and person parameters. The dimensionality can be univariate or multivariate.</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">abstract type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Univariate </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;:</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> Dimensionality</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> end</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">abstract type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Multivariate </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;:</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> Dimensionality</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> end</span></span></code></pre></div><p>Define the person and item dimensionality of your model by specifying the <code>person_dimensionality</code> and <code>item_dimensionality</code> function respectively.</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;">person_dimensionality</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">Type{MyFancyIRTModel}</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">) </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Multivariate</span></span>
<span class="line"><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;">item_dimensionality</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">Type{MyFancyIRTModel}</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">) </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Univariate</span></span></code></pre></div><h4 id="Estimation-type" tabindex="-1">Estimation type <a class="header-anchor" href="#Estimation-type" aria-label="Permalink to &quot;Estimation type {#Estimation-type}&quot;">​</a></h4><p>Defining an estimation type allows dispatching based on the type of parameter estimation in an item response model. AbstractItemResponseModels differentiates between point estimation (e.g. Maximum Likelihood Estimation) and sampling based estimation such as Markov Chain Monte Carlo Methods).</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">abstract type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> PointEstimate </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;:</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> EstimationType</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> end</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">abstract type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> SamplingEstimate </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">&lt;:</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> EstimationType</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> end</span></span></code></pre></div><p>The estimation type can be defined for a model via the <code>estimation_type</code> function.</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;">estimation_type</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">Type{MyFancyIRTModel}</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">) </span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">=</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> PointEstimate</span></span></code></pre></div><h3 id="functions" tabindex="-1">Functions <a class="header-anchor" href="#functions" aria-label="Permalink to &quot;Functions&quot;">​</a></h3><p>Implementing the AbstractItemResponseModels interface requires defining methods for the generic functions provided in this package.</p><p>First a item response function must be provided by extending the <code>irf</code> generic function.</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">irf</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta, i, y)</span></span></code></pre></div><p>Further an item information function must be defined,</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">iif</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta, i, y)</span></span></code></pre></div><p>An item response model is fitted to data by a <code>fit</code> function,</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">fit</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">Type{&lt;:ItemResponseModel}</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, data, args</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">...</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">; kwargs</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">...</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span></code></pre></div><p>If applicable, an expected score function and an information function must be provided.</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">expected_score</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta[, is]; scoring_function)</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">information</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta[, is]; scoring_function)</span></span></code></pre></div><h2 id="Interface-Tests" tabindex="-1">Interface Tests <a class="header-anchor" href="#Interface-Tests" aria-label="Permalink to &quot;Interface Tests {#Interface-Tests}&quot;">​</a></h2><p>AbstractItemResponseModels provides standardized testing of the interface in a separate module <code>Tests</code>.</p><p>To test if your implementation of the interface is correct, add the <code>test_interface</code> function to your <code>test/runtests.jl</code> file as in the example below.</p><div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">using</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> MyFancyIRTPackage</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">using</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> Test</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">using</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;"> AbstractItemResponseModels</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">.</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">Tests</span></span>
<span class="line"></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">@testset</span><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;"> &quot;MyFancyIRTPackage&quot;</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;"> begin</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">    test_interface</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(MyFancyIRTModel, args</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">...</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">; kwargs</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">...</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">) </span></span>
<span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;">    # additional unit tests...</span></span>
<span class="line"><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">end</span></span></code></pre></div><p>If you implement multiple models in your package, make sure to call <code>test_interface</code> for all model types. An example of this can be seen in the <a href="https://github.com/JuliaPsychometrics/RaschModels.jl/blob/main/test/test_interface.jl" target="_blank" rel="noreferrer">RaschModels.jl</a> package.</p>`,44)]))}const g=i(n,[["render",l]]);export{c as __pageData,g as default};