let
  archiveManager = [ "org.gnome.FileRoller" ];
  browser = [ "brave-browser" ];
  documentReader = [ "evince" ];
  imageViewer = [ "org.gnome.Loupe" ];
  videoPlayer = [ "mpv" ];
in
{
  xdg = {
    enable = true;

    mimeApps = {
      enable = true;

      defaultApplications = {
        "application/json"                  = browser;
        "application/x-extension-htm"       = browser;
        "application/x-extension-html"      = browser;
        "application/x-extension-shtml"     = browser;
        "application/x-extension-xht"       = browser;
        "application/x-extension-xhtml"     = browser;
        "application/xhtml+xml"             = browser;
        "text/html"                         = browser;
        "x-scheme-handler/about"            = browser;
        "x-scheme-handler/chrome"           = browser;
        "x-scheme-handler/ftp"              = browser;
        "x-scheme-handler/http"             = browser;
        "x-scheme-handler/https"            = browser;
        "x-scheme-handler/unknown"          = browser;

        "audio/*"                           = videoPlayer;
        "video/*"                           = videoPlayer;
        "image/*"                           = imageViewer;


        "application/pdf"                   = documentReader;


        "application/x-7z-compressed"       = archiveManager;
        "application/x-7z-compressed-tar"   = archiveManager;
        "application/x-bzip"                = archiveManager;
        "application/x-bzip-compressed-tar" = archiveManager;
        "application/x-compress"            = archiveManager;
        "application/x-compressed-tar"      = archiveManager;
        "application/x-cpio"                = archiveManager;
        "application/x-gzip"                = archiveManager;
        "application/x-lha"                 = archiveManager;
        "application/x-lzip"                = archiveManager;
        "application/x-lzip-compressed-tar" = archiveManager;
        "application/x-lzma"                = archiveManager;
        "application/x-lzma-compressed-tar" = archiveManager;
        "application/x-tar"                 = archiveManager;
        "application/x-tarz"                = archiveManager;
        "application/x-xar"                 = archiveManager;
        "application/x-xz"                  = archiveManager;
        "application/x-xz-compressed-tar"   = archiveManager;
        "application/zip"                   = archiveManager;
        "application/gzip"                  = archiveManager;
        "application/bzip2"                 = archiveManager;
        "application/vnd.rar"               = archiveManager;
      };
    };
  };
}
