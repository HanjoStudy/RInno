% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_app.R
\name{create_app}
\alias{create_app}
\title{Creates installation files and Inno Setup Script (ISS), "app_name.iss"}
\usage{
create_app(app_name, app_dir = getwd(), dir_out = "RInno_installer",
  pkgs = c("jsonlite", "shiny", "magrittr"), include_R = F,
  R_version = paste0(R.version$major, ".", R.version$minor), ...)
}
\arguments{
\item{app_name}{The name of the app being installed. It will be displayed throughout the installer and uninstaller in window titles, wizard pages, and dialog boxes. See \href{http://www.jrsoftware.org/ishelp/topic_setup_appname.htm}{[Setup]:AppName} for details. For continuous installations, \code{app_name} is used to check for an R package of the same name, and update it. The Continuous Installation vignette has more details.}

\item{app_dir}{Shiny app's directory, defaults to \code{getwd()}.}

\item{dir_out}{Installer's directory. A sub-directory of \code{app_dir}, which will be created if it does not already exist. Defaults to 'RInno_installer'.}

\item{pkgs}{String vector of the shiny app's default repo package dependencies. See \code{\link{create_config}} for how to change the default repo.}

\item{include_R}{To include R in the installer, \code{include_R = TRUE}. This will include the version of R specified by \code{R_version} in your installer. The installer will check each user's registry for that version of R, and only install it if that check returns FALSE.}

\item{R_version}{R version to use, defaults to: \code{paste0(R.version$major, '.', R.version$minor)}.}

\item{...}{Arguments passed on to \code{setup}
\describe{
  \item{app_version}{Version number of the app being installed, defaults to \code{'0.0.0'}. It is displayed in the Version field of the app's \emph{Add/Remove Programs} entry. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_appversion}{[Setup]:AppVersion} for details.}
  \item{name}{Defaults to ISPP directive, \code{'{#MyAppName}'} set by \code{directives(app_name)}.}
  \item{publisher}{String displayed on the "Support" dialogue of the \emph{Add/Remove Programs} Control Panel applet, defaults to " ". See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_apppublisher}{[Setup]:AppPublisher} for details.}
  \item{default_dir}{The default directory name used by the \emph{Select Destination Page} of the installer. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_defaultdirname}{[Setup]:DefaultDirName} and \href{http://www.jrsoftware.org/ishelp/index.php?topic=consts}{Constants} for details.}
  \item{privilege}{Valid options: \code{'poweruser', 'admin', 'lowest'}. Defaults to \code{'lowest'}. This directive affects whether elevated rights are requested when an installation is started. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_privilegesrequired}{[Setup]:PrivilegesRequired} for details.}
  \item{info_before}{File, in .txt or .rtf format, which is displayed on the first page of the installer. It must be located in \code{app_dir}. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_infobeforefile}{[Setup]:InfoBeforeFile} for details.}
  \item{info_after}{File, in .txt or .rtf format, which is displayed on the last page of the installer. It must be located in \code{app_dir}. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_infoafterfile}{[Setup]:InfoAfterFile} for details.}
  \item{setup_icon}{File name of the icon used for installer/uninstaller. The file must be located in \code{app_dir}. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_setupiconfile}{[Setup]:SetupIconFile} for details.}
  \item{license_file}{File, in .txt or .rtf format, which is displayed before the \emph{Select Destination Page} of the wizard. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_licensefile}{[Setup]:LicenseFile} for details.}
  \item{inst_pw}{Installer password, string. Visit the Inno Setup \href{http://www.jrsoftware.org/isdl.php}{Downloads} page and place \emph{ISCrypt.dll} in your Inno Setup directory. Afterwards, if a \code{inst_pw} is supplied, then the contents of the installer will be encrypted using a 160-bit key derived from the password string. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_password}{[Setup]:Password} and \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_encryption}{[Setup]:Encryption} for details.}
  \item{pub_url}{String. Defaults to \code{'{#MyAppURL}'}, which is the ISPP directive for \code{main_url}. Therefore, \code{main_url} will be used, unless otherwise specified. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_apppublisherurl}{[Setup]:AppPublisherURL} for details.}
  \item{sup_url}{String. Defaults to \code{'{#MyAppURL}'}, which is the ISPP directive for \code{main_url}. Therefore, \code{main_url} will be used, unless otherwise specified. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_appsupporturl}{[Setup]:AppSupportURL} for details.}
  \item{upd_url}{String. Defaults to \code{'{#MyAppURL}'}, which is the ISPP directive for \code{main_url}. Therefore, \code{main_url} will be used, unless otherwise specified. See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_appupdatesurl}{[Setup]:AppUpdatesURL} for details.}
  \item{compression}{Defaults to \code{'lzma2/ultra64'}, which has the best compression ratio available. Other valid options include: \code{'zip'}, \code{'bzip'}, \code{'lzma'}, and \code{'none'}.  See \href{http://www.jrsoftware.org/ishelp/index.php?topic=setup_compression}{[Setup]:Compression} for details.}
}}
}
\description{
This function manages installation and app start up. To accept all defaults, just provide \code{app_name}. After calling \code{create_app}, call \code{\link{compile_iss}} to create an installer in \code{dir_out}.
}
\details{
Creates the following files in \code{app_dir}:
\itemize{
  \item Icons for installer and app, \emph{setup.ico} and \emph{default.ico} respectively.
  \item Files that manage app start up, \emph{utils/package_manager.R} and \emph{utils/app.R}.
  \item First/last page of the installer, \emph{infobefore.txt} and \emph{infoafter.txt}.
  \item Batch support files, \emph{utils/wsf/run.wsf}, \emph{utils/wsf/js/run.js}, \emph{utils/wsf/js/json2.js}, \emph{utils/wsf/js/JSON.minify.js}.
  \item A configuration file, \emph{config.cfg}. See \code{\link{create_config}} for details.
  \item A batch file, \emph{app_name.bat}. See \code{\link{create_bat}} for details.
  \item An Inno Setup Script, \emph{app_name.iss}.
}
}
\examples{
\dontrun{

create_app('myapp')

create_app(
  app_name  = 'My AppName',
  app_dir    = 'My/app/path',
  dir_out   = 'wizard',
  pkgs      = c('jsonlite', 'shiny', 'magrittr', 'xkcd'),
  include_R = TRUE,   # Download R and install it with the app
  R_version = 2.2.1,  # Old version of R
  privilege = 'high', # Admin only installation
  default_dir = 'pf') # Program Files
}
}
\seealso{
\code{\link{get_R}}, \code{\link{copy_installation}}, \code{\link{create_config}}, \code{\link{create_bat}}, \code{\link{create_pkgs}}, \code{\link{directives}}, \code{\link{setup}}, \code{\link{languages}}, \code{\link{tasks}}, \code{\link{files}}, \code{\link{icons}}, \code{\link{run}}, and \code{\link{code}}.
}
\author{
Jonathan M. Hill
}
