#pragma checksum "D:\work\VisualStudio\Library\Library\Views\Catalog\Checkout.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "90e742641e91f99919920450c395d8cfc2fe39df"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Catalog_Checkout), @"mvc.1.0.view", @"/Views/Catalog/Checkout.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Catalog/Checkout.cshtml", typeof(AspNetCore.Views_Catalog_Checkout))]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#line 1 "D:\work\VisualStudio\Library\Library\Views\_ViewImports.cshtml"
using Library;

#line default
#line hidden
#line 2 "D:\work\VisualStudio\Library\Library\Views\_ViewImports.cshtml"
using Library.Models;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"90e742641e91f99919920450c395d8cfc2fe39df", @"/Views/Catalog/Checkout.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"dadb7a731bfbb305c411bc5eb7a307dbd6008a89", @"/Views/_ViewImports.cshtml")]
    public class Views_Catalog_Checkout : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Library.Models.Checkout.CheckoutModel>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("rel", new global::Microsoft.AspNetCore.Html.HtmlString("stylesheet"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/catalog.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            BeginContext(53, 71, false);
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("head", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "90e742641e91f99919920450c395d8cfc2fe39df3949", async() => {
                BeginContext(59, 6, true);
                WriteLiteral("\r\n    ");
                EndContext();
                BeginContext(65, 50, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "90e742641e91f99919920450c395d8cfc2fe39df4332", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                EndContext();
                BeginContext(115, 2, true);
                WriteLiteral("\r\n");
                EndContext();
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            EndContext();
            BeginContext(124, 118, true);
            WriteLiteral("\r\n<div class=\"container\">\r\n    <div class=\"row\">\r\n        <div class=\"col-md-4\">\r\n            <img class=\"detailImage\"");
            EndContext();
            BeginWriteAttribute("src", " src=\"", 242, "\"", 263, 1);
#line 10 "D:\work\VisualStudio\Library\Library\Views\Catalog\Checkout.cshtml"
WriteAttributeValue("", 248, Model.ImageUrl, 248, 15, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(264, 113, true);
            WriteLiteral(" width=\"320px\" height=\"560px\" />\r\n        </div>\r\n        <div class=\"col-md-5\">\r\n            <div class=\"title\">");
            EndContext();
            BeginContext(378, 11, false);
#line 13 "D:\work\VisualStudio\Library\Library\Views\Catalog\Checkout.cshtml"
                          Write(Model.Title);

#line default
#line hidden
            EndContext();
            BeginContext(389, 63, true);
            WriteLiteral("</div>\r\n            <hr />\r\n            <div class=\"details\">\r\n");
            EndContext();
#line 17 "D:\work\VisualStudio\Library\Library\Views\Catalog\Checkout.cshtml"
                 using (Html.BeginForm("PlaceCheckout", "Catalog", FormMethod.Post))
                {
                    

#line default
#line hidden
            BeginContext(617, 30, false);
#line 19 "D:\work\VisualStudio\Library\Library\Views\Catalog\Checkout.cshtml"
               Write(Html.HiddenFor(x => x.AssetId));

#line default
#line hidden
            EndContext();
            BeginContext(649, 112, true);
            WriteLiteral("                    <div>\r\n                        Please insert your Library Card Id:\r\n                        ");
            EndContext();
            BeginContext(762, 37, false);
#line 22 "D:\work\VisualStudio\Library\Library\Views\Catalog\Checkout.cshtml"
                   Write(Html.TextBoxFor(x => x.LibraryCardId));

#line default
#line hidden
            EndContext();
            BeginContext(799, 197, true);
            WriteLiteral("\r\n                    </div>\r\n                    <div class=\"button\">\r\n                        <button type=\"submit\" class=\"btn btn-success btn-lg\">Check Out</button>\r\n                    </div>\r\n");
            EndContext();
#line 27 "D:\work\VisualStudio\Library\Library\Views\Catalog\Checkout.cshtml"
                }

#line default
#line hidden
            BeginContext(1015, 58, true);
            WriteLiteral("            </div>\r\n        </div>\r\n\r\n\r\n    </div>\r\n</div>");
            EndContext();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Library.Models.Checkout.CheckoutModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
