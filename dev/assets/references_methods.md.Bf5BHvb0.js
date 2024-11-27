import{_ as n,c as l,j as s,a as t,G as o,a5 as a,B as d,o as p}from"./chunks/framework.BhDU4OZY.js";const F=JSON.parse('{"title":"Methods","description":"","frontmatter":{},"headers":[],"relativePath":"references/methods.md","filePath":"references/methods.md","lastUpdated":null}'),r={name:"references/methods.md"},c={class:"jldocstring custom-block",open:""},h={class:"jldocstring custom-block",open:""},m={class:"jldocstring custom-block",open:""},u={class:"jldocstring custom-block",open:""},g={class:"jldocstring custom-block",open:""},k={class:"jldocstring custom-block",open:""},f={class:"jldocstring custom-block",open:""},b={class:"jldocstring custom-block",open:""},y={class:"jldocstring custom-block",open:""};function E(I,e,M,R,v,A){const i=d("Badge");return p(),l("div",null,[e[27]||(e[27]=s("h1",{id:"methods_page",tabindex:"-1"},[t("Methods "),s("a",{class:"header-anchor",href:"#methods_page","aria-label":'Permalink to "Methods {#methods_page}"'},"​")],-1)),e[28]||(e[28]=s("h2",{id:"Item-response-functions",tabindex:"-1"},[t("Item response functions "),s("a",{class:"header-anchor",href:"#Item-response-functions","aria-label":'Permalink to "Item response functions {#Item-response-functions}"'},"​")],-1)),s("details",c,[s("summary",null,[e[0]||(e[0]=s("a",{id:"AbstractItemResponseModels.irf-references-methods",href:"#AbstractItemResponseModels.irf-references-methods"},[s("span",{class:"jlbinding"},"AbstractItemResponseModels.irf")],-1)),e[1]||(e[1]=t()),o(i,{type:"info",class:"jlObjectType jlFunction",text:"Function"})]),e[2]||(e[2]=a(`<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">irf</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta, i)</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">irf</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta, i, y)</span></span></code></pre></div><p>Evaluate the item response function of an <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a>.</p><p><strong>Arguments</strong></p><ul><li><p><code>model</code>: An <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a></p></li><li><p><code>theta</code>: The person parameter value(s)</p></li><li><p><code>i</code>: A unique item identifier</p></li><li><p><code>y</code>: Response value(s)</p></li></ul><p><strong>Return values</strong></p><p>If <code>estimation_type(model) == PointEstimate</code> then the item response function must return a scalar value.</p><p>If <code>estimation_type(model) == SamplingEstimate</code> then the item response function must return a vector of values with the length equal to the number of samples.</p><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/3b84dfff2c843d36e151155fa1ac0256a2de138c/src/AbstractItemResponseModels.jl#L47-L65" target="_blank" rel="noreferrer">source</a></p>`,8))]),s("details",h,[s("summary",null,[e[3]||(e[3]=s("a",{id:"AbstractItemResponseModels.iif-references-methods",href:"#AbstractItemResponseModels.iif-references-methods"},[s("span",{class:"jlbinding"},"AbstractItemResponseModels.iif")],-1)),e[4]||(e[4]=t()),o(i,{type:"info",class:"jlObjectType jlFunction",text:"Function"})]),e[5]||(e[5]=a(`<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">iif</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta, i)</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">iif</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta, i, y)</span></span></code></pre></div><p><strong>Arguments</strong></p><ul><li><p><code>model</code>: An <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a></p></li><li><p><code>theta</code>: The person parameter value(s)</p></li><li><p><code>i</code>: A unique item identifier</p></li><li><p><code>y</code>: Response value(s)</p></li></ul><p><strong>Return values</strong></p><p>If <code>estimation_type(model) == PointEstimate</code> then the item information function must return a scalar value.</p><p>If <code>estimation_type(model) == SamplingEstimate</code> then the item information function must return a vector of values with the length equal to the number of samples drawn.</p><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/3b84dfff2c843d36e151155fa1ac0256a2de138c/src/AbstractItemResponseModels.jl#L68-L84" target="_blank" rel="noreferrer">source</a></p>`,7))]),s("details",m,[s("summary",null,[e[6]||(e[6]=s("a",{id:"AbstractItemResponseModels.expected_score-references-methods",href:"#AbstractItemResponseModels.expected_score-references-methods"},[s("span",{class:"jlbinding"},"AbstractItemResponseModels.expected_score")],-1)),e[7]||(e[7]=t()),o(i,{type:"info",class:"jlObjectType jlFunction",text:"Function"})]),e[8]||(e[8]=a(`<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">expected_score</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta; scoring_function)</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">expected_score</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta, is; scoring_function)</span></span></code></pre></div><p>Calculate the expected score of an <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a>.</p><p><strong>Arguments</strong></p><ul><li><p><code>model</code>: An <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a></p></li><li><p><code>theta</code>: The person parameter value(s)</p></li><li><p><code>is</code>: One or multiple item identifiers. If <code>is</code> is omitted, the expected score for the whole test is returned.</p></li></ul><p><strong>Keyword arguments</strong></p><ul><li><code>scoring_function</code>: A binary function of the form <code>f(y, ctx) = x</code>, mapping all possible response values <code>y</code> to</li></ul><p>a value <code>x</code>. The argument <code>ctx</code> contains the current item context.</p><p><strong>Return values</strong></p><p>If <code>estimation_type(model) == PointEstimate</code> then <code>expected_score</code> must return a single scalar value.</p><p>If <code>estimation_type(model) == SamplingEstimate</code> then <code>expected_score</code> must return a vector of values with the length equal to the number of samples drawn.</p><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/3b84dfff2c843d36e151155fa1ac0256a2de138c/src/AbstractItemResponseModels.jl#L92-L113" target="_blank" rel="noreferrer">source</a></p>`,11))]),s("details",u,[s("summary",null,[e[9]||(e[9]=s("a",{id:"AbstractItemResponseModels.information-references-methods",href:"#AbstractItemResponseModels.information-references-methods"},[s("span",{class:"jlbinding"},"AbstractItemResponseModels.information")],-1)),e[10]||(e[10]=t()),o(i,{type:"info",class:"jlObjectType jlFunction",text:"Function"})]),e[11]||(e[11]=a(`<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">information</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta; scoring_function)</span></span>
<span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">information</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, theta, is; scoring_function)</span></span></code></pre></div><p>Calculate the information of an <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a>.</p><p><strong>Arguments</strong></p><ul><li><p><code>theta</code>: The person parameter value(s)</p></li><li><p><code>is</code>: One or multiple item identifiers. If <code>is</code> is omitted, the information of the whole test (test information) is returned.</p></li></ul><p><strong>Keyword arguments</strong></p><ul><li><code>scoring_function</code>: A binary function of the form <code>f(y, ctx) = x</code>, mapping all possible response values <code>y</code> to</li></ul><p>a value <code>x</code>. The argument <code>ctx</code> contains the current item context.</p><p><strong>Return values</strong></p><p>If <code>estimatione_type(model) == PointEstimate</code> then <code>information</code> must return a single scalar value.</p><p>If <code>estimation_type(model) == SamplingEstimate</code> then <code>information</code> must return a vector of values with the length equal to the number of samples drawn.</p><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/3b84dfff2c843d36e151155fa1ac0256a2de138c/src/AbstractItemResponseModels.jl#L120-L140" target="_blank" rel="noreferrer">source</a></p>`,11))]),e[29]||(e[29]=s("h2",{id:"Model-fitting",tabindex:"-1"},[t("Model fitting "),s("a",{class:"header-anchor",href:"#Model-fitting","aria-label":'Permalink to "Model fitting {#Model-fitting}"'},"​")],-1)),s("details",g,[s("summary",null,[e[12]||(e[12]=s("a",{id:"StatsAPI.fit-references-methods",href:"#StatsAPI.fit-references-methods"},[s("span",{class:"jlbinding"},"StatsAPI.fit")],-1)),e[13]||(e[13]=t()),o(i,{type:"info",class:"jlObjectType jlFunction",text:"Function"})]),e[14]||(e[14]=a('<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">fit</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">Type{T}</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, data</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">AbstractMatrix</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, args</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">...</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">; kwargs</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">...</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span></code></pre></div><p>Fit an item response model to response data.</p><p><strong>Arguments</strong></p><ul><li><p><code>data</code>: The observed response data. If <code>data</code> is a response matrix, the columns must describe items and rows describe persons.</p></li><li><p><code>args...</code>: Additional arguments required to fit the <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a></p></li></ul><p><strong>Keyword arguments</strong></p><ul><li><code>kwargs...</code>: Additional keyword arguments required to fit the <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a></li></ul><p><strong>Return values</strong></p><p>A fitted model with <code>T &lt;: ItemResponseModel</code>.</p><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/3b84dfff2c843d36e151155fa1ac0256a2de138c/src/AbstractItemResponseModels.jl#L147-L162" target="_blank" rel="noreferrer">source</a></p>',9))]),e[30]||(e[30]=s("h2",{id:"accessors",tabindex:"-1"},[t("Accessors "),s("a",{class:"header-anchor",href:"#accessors","aria-label":'Permalink to "Accessors"'},"​")],-1)),s("details",k,[s("summary",null,[e[15]||(e[15]=s("a",{id:"AbstractItemResponseModels.get_item_locations-references-methods",href:"#AbstractItemResponseModels.get_item_locations-references-methods"},[s("span",{class:"jlbinding"},"AbstractItemResponseModels.get_item_locations")],-1)),e[16]||(e[16]=t()),o(i,{type:"info",class:"jlObjectType jlFunction",text:"Function"})]),e[17]||(e[17]=a('<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">get_item_locations</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, i)</span></span></code></pre></div><p>Get the item locations for an item from an <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a>.</p><p><strong>Arguments</strong></p><ul><li><p><code>model</code>: An <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a></p></li><li><p><code>i</code>: A unique item identifier</p></li></ul><p><strong>Return values</strong></p><p>If <code>item_dimensionality(model) == Univariate</code> and <code>estimation_type(model) == PointEstimate</code> then <code>get_item_locations</code> must return a single scalar value.</p><p>If <code>item_dimensionality(model) == Multivariate</code> and <code>estimation_type(model) == PointEstimate</code> then <code>get_item_locations</code> must return a vector of values corresponding to the dimensionality of the item parameters.</p><p>If <code>item_dimensionality(model) == Univariate</code> and <code>estimation_type(model) == SamplingEstimate</code> then <code>get_item_locations</code> must return a vector of values with the length equal to the number of samples drawn.</p><p>If <code>item_dimensionality(model) == Multivariate</code> and <code>estimation_type(model) == SamplingEstimate</code> then <code>get_item_locations</code> must return a matrix with rows corresponding to the drawn samples and columns corresponding to the dimension of the item parameter.</p><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/3b84dfff2c843d36e151155fa1ac0256a2de138c/src/AbstractItemResponseModels.jl#L165-L189" target="_blank" rel="noreferrer">source</a></p>',10))]),s("details",f,[s("summary",null,[e[18]||(e[18]=s("a",{id:"AbstractItemResponseModels.get_person_locations-references-methods",href:"#AbstractItemResponseModels.get_person_locations-references-methods"},[s("span",{class:"jlbinding"},"AbstractItemResponseModels.get_person_locations")],-1)),e[19]||(e[19]=t()),o(i,{type:"info",class:"jlObjectType jlFunction",text:"Function"})]),e[20]||(e[20]=a('<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">get_person_locations</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">, p)</span></span></code></pre></div><p>Get the person locations for an person from an <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a>.</p><p><strong>Arguments</strong></p><ul><li><p><code>model</code>: An <a href="/AbstractItemResponseModels.jl/dev/api#AbstractItemResponseModels.ItemResponseModel"><code>ItemResponseModel</code></a></p></li><li><p><code>p</code>: A unique person identifier</p></li></ul><p><strong>Return values</strong></p><p>If <code>person_dimensionality(model) == Univariate</code> and <code>estimation_type(model) == PointEstimate</code> then <code>get_person_locations</code> must return a single scalar value.</p><p>If <code>person_dimensionality(model) == Multivariate</code> and <code>estimation_type(model) == PointEstimate</code> then <code>get_person_locations</code> must return a vector of values corresponding to the dimensionality of the person parameters.</p><p>If <code>person_dimensionality(model) == Univariate</code> and <code>estimation_type(model) == SamplingEstimate</code> then <code>get_person_locations</code> must return a vector of values with the length equal to the number of samples drawn.</p><p>If <code>person_dimensionality(model) == Multivariate</code> and <code>estimation_type(model) == SamplingEstimate</code> then <code>get_person_locations</code> must return a matrix with rows corresponding to the drawn samples and columns corresponding to the dimension of the person parameter.</p><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/3b84dfff2c843d36e151155fa1ac0256a2de138c/src/AbstractItemResponseModels.jl#L196-L220" target="_blank" rel="noreferrer">source</a></p>',10))]),s("details",b,[s("summary",null,[e[21]||(e[21]=s("a",{id:"AbstractItemResponseModels.each_item_index-references-methods",href:"#AbstractItemResponseModels.each_item_index-references-methods"},[s("span",{class:"jlbinding"},"AbstractItemResponseModels.each_item_index")],-1)),e[22]||(e[22]=t()),o(i,{type:"info",class:"jlObjectType jlFunction",text:"Function"})]),e[23]||(e[23]=a('<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">each_item_index</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span></code></pre></div><p>Create an iterable object visiting each item index of an item response model.</p><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/3b84dfff2c843d36e151155fa1ac0256a2de138c/src/AbstractItemResponseModels.jl#L227-L231" target="_blank" rel="noreferrer">source</a></p>',3))]),s("details",y,[s("summary",null,[e[24]||(e[24]=s("a",{id:"AbstractItemResponseModels.each_person_index-references-methods",href:"#AbstractItemResponseModels.each_person_index-references-methods"},[s("span",{class:"jlbinding"},"AbstractItemResponseModels.each_person_index")],-1)),e[25]||(e[25]=t()),o(i,{type:"info",class:"jlObjectType jlFunction",text:"Function"})]),e[26]||(e[26]=a('<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">each_person_index</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">(model</span><span style="--shiki-light:#D73A49;--shiki-dark:#F97583;">::</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;">ItemResponseModel</span><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">)</span></span></code></pre></div><p>Create an iterable object visiting each person index of an item response model.</p><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/3b84dfff2c843d36e151155fa1ac0256a2de138c/src/AbstractItemResponseModels.jl#L234-L238" target="_blank" rel="noreferrer">source</a></p>',3))])])}const C=n(r,[["render",E]]);export{F as __pageData,C as default};
