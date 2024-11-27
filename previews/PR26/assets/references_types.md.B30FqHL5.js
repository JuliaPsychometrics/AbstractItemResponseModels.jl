import{_ as n,c as a,j as e,a as t,G as i,a5 as p,B as r,o as l}from"./chunks/framework.Dsh41DDZ.js";const I=JSON.parse('{"title":"Types","description":"","frontmatter":{},"headers":[],"relativePath":"references/types.md","filePath":"references/types.md","lastUpdated":null}'),d={name:"references/types.md"},c={class:"jldocstring custom-block",open:""};function m(f,s,b,R,u,h){const o=r("Badge");return l(),a("div",null,[s[3]||(s[3]=e("h1",{id:"types_page",tabindex:"-1"},[t("Types "),e("a",{class:"header-anchor",href:"#types_page","aria-label":'Permalink to "Types {#types_page}"'},"​")],-1)),s[4]||(s[4]=e("p",null,[t("Item response models in the AbstractItemResponseModels.jl interface are represented by a single abstract type, "),e("a",{href:"/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.ItemResponseModel"},[e("code",null,"ItemResponseModel")]),t(". Every implementation of an item response model by a package author "),e("em",null,"must"),t(" inherit from "),e("a",{href:"/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.ItemResponseModel"},[e("code",null,"ItemResponseModel")]),t(".")],-1)),e("details",c,[e("summary",null,[s[0]||(s[0]=e("a",{id:"AbstractItemResponseModels.ItemResponseModel-references-types",href:"#AbstractItemResponseModels.ItemResponseModel-references-types"},[e("span",{class:"jlbinding"},"AbstractItemResponseModels.ItemResponseModel")],-1)),s[1]||(s[1]=t()),i(o,{type:"info",class:"jlObjectType jlType",text:"Type"})]),s[2]||(s[2]=p('<div class="language-julia vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">julia</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#24292E;--shiki-dark:#E1E4E8;">ItemResponseModel</span></span></code></pre></div><p>An abstract type representing an item response theory model.</p><p>Each implementation <code>T &lt;: ItemResponseModel</code> must define the following traits:</p><ul><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.response_type-Tuple{T} where T"><code>response_type</code></a>: A valid <a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.ResponseType"><code>ResponseType</code></a></p></li><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.person_dimensionality-Tuple{T} where T"><code>person_dimensionality</code></a>: The number of dimensions for the person parameters</p></li><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.item_dimensionality-Tuple{T} where T"><code>item_dimensionality</code></a>: The number of dimensions for the item parameters</p></li><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.estimation_type-Tuple{T} where T"><code>estimation_type</code></a>: A valid <a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.EstimationType"><code>EstimationType</code></a></p></li></ul><p>Additionally <code>T &lt;: ItemResponseModel</code> must implement the following interface:</p><ul><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.irf"><code>irf</code></a>: An item response function returning the probability that a person with given ability estimate will answer an item with a particular response.</p></li><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.iif"><code>iif</code></a>: An item information function returning the information of answering with a particular response on an item given an ability estimate.</p></li><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.expected_score"><code>expected_score</code></a>: An expected score function returning the expected score for one or multiple items, given an ability estimate.</p></li><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.information"><code>information</code></a>: An information function returning the information of one or multiple items, given an ability estimate.</p></li><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#StatsAPI.fit"><code>fit</code></a>: A function fitting an item response model of type <code>T</code> to observed data.</p></li><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.get_item_locations-Tuple{ItemResponseModel, Any}"><code>get_item_locations</code></a>: A function returning the item locations for a given item.</p></li><li><p><a href="/AbstractItemResponseModels.jl/previews/PR26/api#AbstractItemResponseModels.get_person_locations-Tuple{ItemResponseModel, Any}"><code>get_person_locations</code></a>: A function returning the person locations for a given person.</p></li></ul><p><a href="https://github.com/JuliaPsychometrics/AbstractItemResponseModels.jl/blob/64e9a67dc3b93eefcf3c6497d05abf8fc0b34ec9/src/AbstractItemResponseModels.jl#L21-L44" target="_blank" rel="noreferrer">source</a></p>',7))])])}const y=n(d,[["render",m]]);export{I as __pageData,y as default};