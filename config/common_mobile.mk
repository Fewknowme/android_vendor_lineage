# Inherit common mobile Lineage stuff
$(call inherit-product, vendor/lineage/config/common.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    ExactCalculator

# DocumentsUI
PRODUCT_PACKAGES += \
    PixelDocumentsUIGoogleOverlay

# Lineage packages
PRODUCT_PACKAGES += \
    Backgrounds \
    Etar \
    Profiles \
    Seedvault

ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif

ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    TrebuchetQuickStepGo

PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStepGo
else
PRODUCT_PACKAGES += \
    TrebuchetQuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStep
endif

# Accents
PRODUCT_PACKAGES += \
    AccentColoriOSBlueOverlay \
    AccentColorHadalZoneOverlay \
    AccentColorLostInForestOverlay \
    AccentColorMagentaOverlay \
    AccentColorPixelBlueOverlay \
    AccentColorPurpleHeatOverlay \
    AccentColorRedOverlay \
    AccentColorRoseOverlay \
    AccentColorScooterOverlay \
    AccentColorSlateOverlay \
    AccentColorSuperNovaOverlay \
    AccentColorTealOverlay \
    AccentColorTorchRedOverlay \
    LineageBlackTheme \
    LineageBlackAccent \
    LineageBlueAccent \
    LineageBrownAccent \
    LineageCyanAccent \
    LineageGreenAccent \
    LineageOrangeAccent \
    LineagePinkAccent \
    LineagePurpleAccent \
    LineageRedAccent \
    LineageYellowAccent

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Customizations
PRODUCT_PACKAGES += \
    IconShapeSquareOverlay \
    LineageNavigationBarNoHint \
    NavigationBarMode2ButtonOverlay

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
