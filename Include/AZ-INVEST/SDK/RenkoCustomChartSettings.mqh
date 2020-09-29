#include <AZ-INVEST/SDK/CommonSettings.mqh>

#ifdef DEVELOPER_VERSION
   #define CUSTOM_CHART_NAME "Renko_TEST"
#else
   
   #ifdef P_RENKO_BR_PRO
      #define CUSTOM_CHART_NAME "P-RENKO Ultimate"
   #else
      #define CUSTOM_CHART_NAME "Ultimate Renko"
   #endif 
#endif

//
// Tick chart specific settings
//

#ifdef SHOW_INDICATOR_INPUTS
   #ifdef MQL5_MARKET_DEMO // hardcoded values
   
      int                           barSizeInTicks = 200;               // Renko body size (in ticks)
      input ENUM_CUSTOM_BAR_TYPE    PredefinedSetting=cbtRenko;         // Renko mode preset
      int                           InpOpen=50;                         // Open offset % (0 to ..)
      int                           InpRevShadow=50;                    // Reversal Open offset % (0 to ..)
      int                           InpRev=150;                         // Reversal bar size % (0 to ..)
      ENUM_BOOL                     showWicks = true;                   // Show wicks
      ENUM_BOOL                     atrEnabled = false;                 // Enable ATR based bar size calculation
      ENUM_TIMEFRAMES               atrTimeFrame = PERIOD_D1;           // Use ATR period
      int                           atrPeriod = 14;                     // ATR period
      int                           atrPercentage = 10;                 // Use percentage of ATR
      ENUM_BOOL                     applyOffsetToFirstBar = true;       // Truncate trailing digits on the first renko
      int                           offsetValue = 0;                    // Number of digits to truncate
      int                           showNumberOfDays = 21;              // Show history for number of days
      ENUM_BOOL                     resetOpenOnNewTradingDay = false;   // Synchronize first bar's open on new day
   
   #else // Main Inputs block
   
      #ifdef P_RENKO_BR //################################################################################################
      
         input int                     barSizeInTicks = 100;               // Tamanho do Renko (em ticks)
         
         input ENUM_CUSTOM_BAR_TYPE    PredefinedSetting=cbtRenko;         // Preset do Renko
         input int                     InpOpen=50;                         // Offset de abertura %
         input int                     InpRevShadow=50;                    // Offset de abertura da reversão %
         input int                     InpRev=150;                         // Tamanho da barra de reversão %
         
         input ENUM_BOOL               showWicks = true;                   // Mostrar Pavio
         
         input ENUM_BOOL               atrEnabled = false;                 // Habilitar Tamanho pelo ATR
               ENUM_TIMEFRAMES         atrTimeFrame = PERIOD_D1;           // Usar Período do ATR
         input int                     atrPeriod = 14;                     // Período do ATR
         input int                     atrPercentage = 10;                 // Usar Percentual do ATR
         
         input ENUM_BOOL               applyOffsetToFirstBar = false;      // Truncar os dígitos finais no primeiro renko
         input int                     offsetValue = 1;                    // Número de dígitos a serem truncados
         
         input int                     showNumberOfDays = 5;               // Número de dias para mostrar histórico
         input ENUM_BOOL               resetOpenOnNewTradingDay = true;    // Sincronizar abertura do primeiro box
      
      #else //###########################################################################################################
      
         input int                     barSizeInTicks = 100;               // Renko body size (in ticks)
         
         input ENUM_CUSTOM_BAR_TYPE    PredefinedSetting=cbtRenko;         // Renko mode preset
         input int                     InpOpen=50;                         // Open offset % (0 to ..)
         input int                     InpRevShadow=50;                    // Reversal Open offset % (0 to ..)
         input int                     InpRev=150;                         // Reversal bar size % (0 to ..)
         
         input ENUM_BOOL               showWicks = true;                   // Show wicks
         
         input ENUM_BOOL               atrEnabled = false;                 // Enable ATR based bar size calculation
               ENUM_TIMEFRAMES         atrTimeFrame = PERIOD_D1;           // Use ATR period
         input int                     atrPeriod = 14;                     // ATR period
         input int                     atrPercentage = 10;                 // Use percentage of ATR
         
         input ENUM_BOOL               applyOffsetToFirstBar = false;      // Truncate trailing digits on the first renko
         input int                     offsetValue = 1;                    // Number of digits to truncate
         
         input int                     showNumberOfDays = 5;               // Show history for number of days
         input ENUM_BOOL               resetOpenOnNewTradingDay = true;    // Synchronize first bar's open on new day
         
      #endif //#########################################################################################################
   #endif
#else // don't SHOW_INDICATOR_INPUTS 
      int                           barSizeInTicks = 180;               // Range bar size (in ticks)
      ENUM_CUSTOM_BAR_TYPE          PredefinedSetting=cbtRenko;         // Renko mode preset
      int                           InpOpen=50;                         // Open offset % (0 to ..)
      int                           InpRevShadow=50;                    // Reversal Open offset % (0 to ..)
      int                           InpRev=150;                         // Reversal bar size % (0 to ..)
      
      ENUM_BOOL                     showWicks = true;                   // Show wicks
      ENUM_BOOL                     atrEnabled = false;                 // Enable ATR based bar size calculation
      ENUM_TIMEFRAMES               atrTimeFrame = PERIOD_D1;           // Use ATR period
      int                           atrPeriod = 14;                     // ATR period
      int                           atrPercentage = 10;                 // Use percentage of ATR
      ENUM_BOOL                     applyOffsetToFirstBar = false;      // Truncate trailing digits on the first renko
      int                           offsetValue = 1;                    // Number of digits to truncate
      int                           showNumberOfDays = 7;               // Show history for number of days
      ENUM_BOOL                     resetOpenOnNewTradingDay = true;    // Synchronize first bar's open on new day
#endif

//
// Remaining settings are located in the include file below.
// These are common for all custom charts
//

#include <az-invest/sdk/CustomChartSettingsBase.mqh>

struct RENKO_SETTINGS
{
   int                  barSizeInTicks;
   ENUM_CUSTOM_BAR_TYPE predefinedSettings;
   double               pOpen;
   double               pReversal;
   double               pReversalShadow;
   ENUM_BOOL            showWicks;
   ENUM_BOOL            atrEnabled;
   ENUM_TIMEFRAMES      atrTimeFrame;
   int                  atrPeriod;
   int                  atrPercentage;
   int                  showNumberOfDays;
   ENUM_BOOL            resetOpenOnNewTradingDay;     
   ENUM_BOOL            applyOffsetToFirstBar;
   int                  offsetValue;      
};

class CRenkoCustomChartSettigns : public CCustomChartSettingsBase
{
   protected:
      
   RENKO_SETTINGS settings;

   public:
   
   CRenkoCustomChartSettigns();
   ~CRenkoCustomChartSettigns();

   RENKO_SETTINGS GetCustomChartSettings() { return this.settings; };   
   
   virtual void SetCustomChartSettings();
   virtual string GetSettingsFileName();
   virtual uint CustomChartSettingsToFile(int handle);
   virtual uint CustomChartSettingsFromFile(int handle);
};

void CRenkoCustomChartSettigns::CRenkoCustomChartSettigns()
{
   settingsFileName = GetSettingsFileName();
}

void CRenkoCustomChartSettigns::~CRenkoCustomChartSettigns()
{
}

string CRenkoCustomChartSettigns::GetSettingsFileName()
{
   return CUSTOM_CHART_NAME+(string)ChartID()+".set";  
}

uint CRenkoCustomChartSettigns::CustomChartSettingsToFile(int file_handle)
{
   return FileWriteStruct(file_handle,this.settings);
}

uint CRenkoCustomChartSettigns::CustomChartSettingsFromFile(int file_handle)
{
   return FileReadStruct(file_handle,this.settings);
}

void CRenkoCustomChartSettigns::SetCustomChartSettings()
{
   settings.barSizeInTicks = barSizeInTicks;
   settings.predefinedSettings = PredefinedSetting;
   settings.pOpen = MathAbs(InpOpen * 0.01);                            // value as percentage
   settings.pReversal = MathAbs(InpRev * 0.01);                         // value as percentage
   settings.pReversalShadow = fmax(0.01, MathAbs(InpRevShadow * 0.01)); // value as percentage   
   settings.showWicks = showWicks;
   settings.atrEnabled = atrEnabled;
   settings.atrTimeFrame = atrTimeFrame;
   settings.atrPeriod = atrPeriod;
   settings.atrPercentage = atrPercentage;
   settings.showNumberOfDays = showNumberOfDays;
   settings.resetOpenOnNewTradingDay = resetOpenOnNewTradingDay;
   settings.applyOffsetToFirstBar = applyOffsetToFirstBar;
   settings.offsetValue = ((MathAbs(offsetValue) >= _Digits) ? 0 : MathAbs(offsetValue));
}
