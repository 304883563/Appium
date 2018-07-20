using OpenQA.Selenium.Appium.Enums;
using OpenQA.Selenium.Remote;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium.Appium.Android;

namespace Test1
{
    class Program
    {
        static void test1() {
            DesiredCapabilities capabilities = new DesiredCapabilities();
            capabilities.SetCapability(AndroidMobileCapabilityType.AppPackage, "com.tencent.mobileqq");
            capabilities.SetCapability(AndroidMobileCapabilityType.AppActivity, "com.tencent.mobileqq.activity.SplashActivity");
            capabilities.SetCapability(MobileCapabilityType.DeviceName, "xiaomi");
            capabilities.SetCapability(MobileCapabilityType.Udid, "36LBB17713514835");
            capabilities.SetCapability(MobileCapabilityType.PlatformName, "android");
            capabilities.SetCapability(MobileCapabilityType.NoReset, true);
            capabilities.SetCapability("newCommandTimeout", 3600);
            capabilities.SetCapability("getCurrentSession", true);
            AndroidDriver<AndroidElement> driver = new AndroidDriver<AndroidElement>(new Uri("http://127.0.0.1:4723/wd/hub"), capabilities, TimeSpan.FromSeconds(180));
            var c= driver.SessionDetails;
        }
        static void test2()
        {
            DesiredCapabilities capabilities = new DesiredCapabilities();
            capabilities.SetCapability(AndroidMobileCapabilityType.AppPackage, "com.tencent.mobileqq");
            capabilities.SetCapability(AndroidMobileCapabilityType.AppActivity, "com.tencent.mobileqq.activity.SplashActivity");
            capabilities.SetCapability(MobileCapabilityType.DeviceName, "1234");
            capabilities.SetCapability(MobileCapabilityType.Udid, "36LBB17713514835");
            capabilities.SetCapability(MobileCapabilityType.PlatformName, "android");
            capabilities.SetCapability(MobileCapabilityType.NoReset, true);
            capabilities.SetCapability("newCommandTimeout", 3600);
            AndroidDriver<AndroidElement> driver = new AndroidDriver<AndroidElement>(new Uri("http://127.0.0.1:4723/wd/hub"), capabilities, TimeSpan.FromSeconds(180));
        }
        static void Main(string[] args)
        {
            test1();

        }
    }
}
