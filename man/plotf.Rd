\name{plotf}
\alias{plotf}
\title{Plot to multiple devices}
\description{
  Sends the same plot to one or several devices in a uniform manner.
  Helpful for preparing a script that can be configured to produce
  graphics in several different formats, e.g. small
  bitmaps for web pages, large bitmaps for slides, and pdf, eps or wmf
  for inclusion in documents.
}
\usage{
plotf(theplot, file="plot\%03d", type=c("active"),
      size=c(6,4,10,96), prepare=a.resetplotparams, ...)
}
\arguments{
\item{theplot}{
  An object representing the plot. This can either be an
  \code{expression} such as \code{expression(plot(x), points(pp))} or a
  Lattice object such as \code{xyplot(y~x)}.
  The object will be \code{eval}-uated (if an expression) or
  \code{print}-ed (if a Lattice object) once on each device to be used.
  Note that this repeated processing may be inefficient if the plotting
  process itself (rather than just the resulting plot) is extremely complex.
  In such (rare) cases, you may want to
  consider manually using \code{dev.print} instead.
  \code{plotf} uses repeated processing rather than \code{dev.print}
  to ensure that the plotting function works
  as intended even if it discriminates between different devices.
}
\item{file}{
  The basename of the file to be produced. A suitable suffix of
  \code{.eps, .ps, .pdf, .png, .jpg}, or \code{.wmf}, respectively, 
  will be appended for the actual files produced.
  The filename is ignored for the \code{"active"} device.
}
\item{type}{
  A character vector in which each entry represents one device to be
  used.
  Allowed values are \code{"active", "current", "eps", "ps", "pdf",
  "png", "jpg", "jpeg", "wmf"} and they represent the use of
  \code{dev.cur, dev.cur, dev.copy2eps, postscript, pdf, png, jpeg,
  jpeg}, and \code{win.metafile}, respectively.
  \code{"eps"} is ignored unless \code{"active"} (or \code{"current"})
  is also present.
}
\item{size}{
  A numeric vector of 1 to 4 components to which missing values will be
  added from the default value. Components 1 and 2 are width and height
  (in inches) of the plot to be produced. They will be supplied to the
  devices' \code{width} and \code{height} arguments, respectively.
  Component 3 is the base character size and will be supplied to the
  \code{pointsize} argument. For the bitmap devices, it will be corrected
  for resolution (which is indicated (in dpi) by component 4), because those
  devices always assume a resolution of 72dpi. Component 4 will also be
  supplied as the \code{res} argument to the bitmap devices.
}
\item{prepare}{
  A function without parameters that will be called each time after a
  new device has been opened and before the plot is produced.
}
\item{...}{
All further arguments will be handed over to each(!) of the device
opening functions
}
}
\value{\code{invisible()}}
\details{
  The function uses \code{on.exit} to close a device correctly even if
  the plot function fails.
  png is almost always preferable to jpeg.
  Note that expressions can contain multiple calls by separating them
  with commas.
}
\author{Lutz Prechelt \email{prechelt@inf.fu-berlin.de}}
\seealso{
\code{\link{a.resetplotparams}},
\code{\link{dev.cur}},
\code{\link{dev.copy2eps}},
\code{\link{postscript}},
\code{\link{pdf}},
\code{\link{png}},
\code{\link{jpeg}}.
}
\examples{
  x = runif(40)*4
  y = x + runif(40)
  plotf(expression(plot(x, y, type="p"))) # plots to active device only
  plotf(xyplot(y~x), "myplot", type=c("active", "png", "pdf"), size=c(3,3))
}
\keyword{device}
