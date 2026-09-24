## Thorstensson et al. 1977, Figure 3 ------------------------------------------
##
## Reproducible digitisation of data-raw/thorstensson1977/thorstensson-1977.png
##
## The figure shows peak torque (% of MVC) at 180 degrees/s against relative
## fast-twitch fibre area (% FT area) for 39 individuals in five groups:
##   filled circles      sprinters
##   filled triangles    downhill skiers
##   stars               race walkers
##   small open circles  orienteers
##   large open circles  sedentary men
## A regression line (y = 0.30x + 44) is drawn through the data.
##
## Pipeline (all automatic, base R + the png package for reading the image):
##   1. threshold the scan to a binary image
##   2. find the axes (longest dark runs) and the inward-pointing tick marks,
##      fit the pixel -> data calibration on the ticks (0, 20, ..., 100)
##   3. label 8-connected components inside the axes
##   4. isolated markers: classify by shape (holes, fill, widest row)
##   5. markers touching the regression line or each other: fit the line,
##      mask it out, and locate markers by normalised cross-correlation with
##      templates averaged from the isolated markers of each type
##   6. detections whose footprint overlaps another marker are flagged; their
##      symbol type was confirmed against a magnified image and, where the
##      template score was a near-tie, set in the `overrides` table below
##   7. write the data set and a diagnostic figure
##
## Outputs: data-raw/thorstensson1977/thorstensson1977.csv
##          data-raw/thorstensson1977/thorstensson-1977-digitized.png
##
## Run from the package root:  Rscript data-raw/thorstensson1977.R

library(png)

src <- "data-raw/thorstensson1977/thorstensson-1977.png"
out_csv <- "data-raw/thorstensson1977/thorstensson1977.csv"
out_png <- "data-raw/thorstensson1977/thorstensson-1977-digitized.png"

expected_n <- 39   # n given in the figure caption

## Regions inside the axes that contain text, not data (data units)
exclusion_zones <- data.frame(
  label = c("Velocity: 180 degrees/sec", "% FT area"),
  xmin = c(5, 74), xmax = c(60, 100), ymin = c(91, 3), ymax = c(99, 13)
)

## Symbol types assigned by visual inspection of the magnified scan for
## markers that overlap another marker (template scores were near-ties there).
## Keyed by approximate data coordinates; only applied to flagged detections.
overrides <- data.frame(
  x = 58, y = 60.5, type = "downhill_skier",
  note = "triangle whose base overlaps the small open circle just below it"
)

## ---- 1. read and threshold ---------------------------------------------------
img <- readPNG(src)
alpha <- if (dim(img)[3] == 4) img[, , 4] else 1
gray <- (0.299 * img[, , 1] + 0.587 * img[, , 2] + 0.114 * img[, , 3]) * alpha + (1 - alpha)
dark <- gray < 0.5
H <- nrow(dark); W <- ncol(dark)

## ---- 2. axes, ticks and calibration -----------------------------------------
longest_run <- function(v) { r <- rle(v); if (any(r$values)) max(r$lengths[r$values]) else 0 }
xax_rows <- which(apply(dark, 1, longest_run) > 0.5 * W)   # x axis (horizontal)
yax_cols <- which(apply(dark, 2, longest_run) > 0.5 * H)   # y axis (vertical)
xax <- mean(xax_rows); yax <- mean(yax_cols)
inside <- (row(dark) < min(xax_rows) - 1) & (col(dark) > max(yax_cols) + 1)

## ---- 3. connected components ------------------------------------------------
label_components <- function(mask) {
  H <- nrow(mask); W <- ncol(mask); lab <- matrix(0L, H, W); cur <- 0L
  for (s in which(mask)) {
    if (lab[s] != 0L) next
    cur <- cur + 1L; stack <- s; lab[s] <- cur
    while (length(stack)) {
      p <- stack[length(stack)]; stack <- stack[-length(stack)]
      i <- (p - 1L) %% H + 1L; j <- (p - 1L) %/% H + 1L
      for (di in -1:1) for (dj in -1:1) {
        ii <- i + di; jj <- j + dj
        if (ii < 1 || ii > H || jj < 1 || jj > W) next
        q <- (jj - 1L) * H + ii
        if (mask[q] && lab[q] == 0L) { lab[q] <- cur; stack <- c(stack, q) }
      }
    }
  }
  lab
}
comp_stats <- function(lab) {
  ids <- setdiff(sort(unique(as.vector(lab))), 0L)
  st <- do.call(rbind, lapply(ids, function(k) {
    w <- which(lab == k); i <- (w - 1) %% nrow(lab) + 1; j <- (w - 1) %/% nrow(lab) + 1
    data.frame(id = k, n = length(w), rmin = min(i), rmax = max(i), cmin = min(j), cmax = max(j),
               rc = mean(i), cc = mean(j))
  }))
  st$h <- st$rmax - st$rmin + 1; st$w <- st$cmax - st$cmin + 1
  st
}
lab <- label_components(dark & inside)
st <- comp_stats(lab)

## tick marks: short strokes hugging the axes on the inside of the plot
xt <- st[st$rmax >= min(xax_rows) - 3 & st$h <= 12 & st$w <= 6 & st$n >= 15, ]
yt <- st[st$cmin <= max(yax_cols) + 3 & st$w <= 12 & st$h <= 6 & st$n >= 15, ]
xt <- xt[order(xt$cc), ]; yt <- yt[order(-yt$rc), ]
stopifnot(nrow(xt) == 5, nrow(yt) == 5)          # ticks at 20, 40, 60, 80, 100
xfit <- lm(val ~ px, data.frame(px = c(yax, xt$cc), val = seq(0, 100, 20)))
yfit <- lm(val ~ px, data.frame(px = c(xax, yt$rc), val = seq(0, 100, 20)))
cat("Calibration residuals (data units) x:", round(resid(xfit), 2), " y:", round(resid(yfit), 2), "\n")
px2x <- function(col) unname(coef(xfit)[1] + coef(xfit)[2] * col)
px2y <- function(row) unname(coef(yfit)[1] + coef(yfit)[2] * row)
x2px <- function(x) unname((x - coef(xfit)[1]) / coef(xfit)[2])
y2px <- function(y) unname((y - coef(yfit)[1]) / coef(yfit)[2])
st$x <- px2x(st$cc); st$y <- px2y(st$rc)
in_zone <- function(x, y) {
  Reduce(`|`, lapply(seq_len(nrow(exclusion_zones)), function(k) {
    z <- exclusion_zones[k, ]; x >= z$xmin & x <= z$xmax & y >= z$ymin & y <= z$ymax
  }))
}

## ---- 4. isolated markers: shape classification ------------------------------
hole_area <- function(sub) {   # background pixels not reachable from the border
  bg <- !sub; H <- nrow(bg); W <- ncol(bg)
  reach <- matrix(FALSE, H, W)
  stack <- which(bg & (row(bg) == 1 | row(bg) == H | col(bg) == 1 | col(bg) == W))
  reach[stack] <- TRUE
  while (length(stack)) {
    p <- stack[length(stack)]; stack <- stack[-length(stack)]
    i <- (p - 1) %% H + 1; j <- (p - 1) %/% H + 1
    for (d in list(c(-1, 0), c(1, 0), c(0, -1), c(0, 1))) {
      ii <- i + d[1]; jj <- j + d[2]
      if (ii < 1 || ii > H || jj < 1 || jj > W) next
      q <- (jj - 1) * H + ii
      if (bg[q] && !reach[q]) { reach[q] <- TRUE; stack <- c(stack, q) }
    }
  }
  sum(bg & !reach)
}
st$hole <- NA; st$widest <- NA; st$fill <- st$n / (st$h * st$w)
for (k in seq_len(nrow(st))) {
  s <- st[k, ]
  sub <- matrix(FALSE, s$h + 2, s$w + 2)
  sub[2:(s$h + 1), 2:(s$w + 1)] <- lab[s$rmin:s$rmax, s$cmin:s$cmax] == s$id
  st$hole[k] <- hole_area(sub)
  st$widest[k] <- (which.max(rowSums(sub)) - 2) / (s$h - 1)   # 0 = top row, 1 = bottom row
}
classify_shape <- function(s) {
  ifelse(s$hole >= 4 & pmax(s$h, s$w) >= 14, "sedentary",   # large open circle
  ifelse(s$hole >= 4,                        "orienteer",   # small open circle
  ifelse(s$fill >= 0.72,                     "sprinter",    # filled circle
  ifelse(s$widest >= 0.75,                   "downhill_skier",  # triangle, widest at its base
                                             "race_walker"))))  # star
}
marker_size <- with(st, h >= 8 & h <= 17 & w >= 8 & w <= 17 & n >= 40)
st$role <- "noise"
st$role[marker_size] <- "marker"
st$role[st$n >= 40 & !marker_size & st$h >= 8 & st$w >= 8] <- "unresolved"   # line, fused markers, text
st$role[in_zone(st$x, st$y) | st$y > 100] <- "text"
st$role[st$id %in% c(xt$id, yt$id)] <- "tick"
st$type <- NA
st$type[st$role == "marker"] <- classify_shape(st[st$role == "marker", ])
clean <- st[st$role == "marker", ]
cat("Isolated markers classified by shape:", nrow(clean), "\n")

## ---- 5. regression line + template matching for the cluttered regions ------
big <- st$id[which.max(st$n)]                    # the regression line (plus what touches it)
w <- which(lab == big); pr <- (w - 1) %% H + 1; pc <- (w - 1) %/% H + 1
keep <- rep(TRUE, length(w))
for (it in 1:20) {                               # iteratively re-weighted straight-line fit
  lfit <- lm(pr ~ pc, subset = keep)
  keep_new <- abs(pr - predict(lfit, data.frame(pc = pc))) < 2.5
  if (identical(keep_new, keep)) break
  keep <- keep_new
}
line_slope_data <- coef(lfit)[2] * coef(yfit)[2] / coef(xfit)[2]
line_int_data <- px2y(coef(lfit)[1] + coef(lfit)[2] * x2px(0))
cat(sprintf("Regression line recovered from the figure: y = %.3f x + %.1f (caption: y = 0.30 x + 44)\n",
            line_slope_data, line_int_data))
dist_line <- abs(row(dark) - (coef(lfit)[1] + coef(lfit)[2] * col(dark))) * cos(atan(coef(lfit)[2]))
mask <- (inside & dist_line > 3) * 1             # pixels used in the correlation
I <- (dark & inside) * 1

TS <- 19; r <- (TS - 1) / 2                      # template size (px)
crop_at <- function(m, rc, cc) {
  i <- round(rc) + (-r:r); j <- round(cc) + (-r:r)
  out <- matrix(0, TS, TS); oi <- i >= 1 & i <= H; oj <- j >= 1 & j <= W
  out[oi, oj] <- m[i[oi], j[oj]] * 1; out
}
templates <- lapply(split(clean, clean$type), function(s)
  Reduce(`+`, lapply(seq_len(nrow(s)), function(k) crop_at(lab == s$id[k], s$rc[k], s$cc[k]))) / nrow(s))

masked_ncc <- function(I, M, Tm) {               # normalised cross-correlation ignoring masked pixels
  th <- nrow(Tm); tw <- ncol(Tm); oh <- nrow(I) - th + 1; ow <- ncol(I) - tw + 1
  MI <- M * I; MI2 <- M * I^2
  z <- matrix(0, oh, ow); sMIT <- z; sMI <- z; sMT <- z; sMT2 <- z; sMI2 <- z; nM <- z
  for (u in 1:th) for (v in 1:tw) {
    ri <- u:(u + oh - 1); ci <- v:(v + ow - 1)
    m <- M[ri, ci]; mi <- MI[ri, ci]; t <- Tm[u, v]
    sMIT <- sMIT + mi * t; sMI <- sMI + mi; sMT <- sMT + m * t; sMT2 <- sMT2 + m * t^2
    sMI2 <- sMI2 + MI2[ri, ci]; nM <- nM + m
  }
  num <- sMIT - sMI * sMT / pmax(nM, 1)
  vI <- sMI2 - sMI^2 / pmax(nM, 1); vT <- sMT2 - sMT^2 / pmax(nM, 1)
  out <- num / sqrt(pmax(vI * vT, 1e-9)); out[vI < 1 | vT < 1 | nM < 0.4 * th * tw] <- 0
  full <- matrix(0, nrow(I), ncol(I)); full[(r + 1):(r + oh), (r + 1):(r + ow)] <- out; full
}
local_max <- function(Mp, rad = 3, thr = 0.55) {
  H <- nrow(Mp); W <- ncol(Mp); mx <- Mp
  for (di in -rad:rad) for (dj in -rad:rad) {
    if (di == 0 && dj == 0) next
    sh <- matrix(-Inf, H, W); ri <- max(1, 1 - di):min(H, H - di); rj <- max(1, 1 - dj):min(W, W - dj)
    sh[ri, rj] <- Mp[ri + di, rj + dj]; mx <- pmax(mx, sh)
  }
  which(Mp >= thr & Mp >= mx, arr.ind = TRUE)
}
cat("Template matching ...\n")
maps <- lapply(templates, masked_ncc, I = I, M = mask)

## sanity check: the templates re-find every isolated marker with the same type
at_clean <- simplify2array(lapply(maps, function(m) m[cbind(round(clean$rc), round(clean$cc))]))
cat(sprintf("Template check on isolated markers: %d of %d score >= 0.5, %d get the same type as the shape rule\n",
            sum(apply(at_clean, 1, max) >= 0.5), nrow(clean), sum(names(maps)[apply(at_clean, 1, which.max)] == clean$type)))

## greedy "explain-away" detection in the cluttered regions: search an image
## holding only the fused components, accept the best remaining match, mask its
## footprint out of the image and re-score around it
I <- matrix(lab %in% st$id[st$role == "unresolved"], H, W) * 1
maps <- lapply(templates, masked_ncc, I = I, M = mask)
dilate <- function(m, k) {                       # binary dilation by k pixels (square)
  out <- m; H <- nrow(m); W <- ncol(m)
  for (di in -k:k) for (dj in -k:k) {
    ri <- max(1, 1 - di):min(H, H - di); rj <- max(1, 1 - dj):min(W, W - dj)
    out[ri, rj] <- out[ri, rj] | m[ri + di, rj + dj]
  }
  out
}
valid <- dilate(matrix(lab %in% st$id[st$role == "unresolved"], H, W), r)   # within a marker radius of a fused component
for (k in seq_len(nrow(clean)))                                              # not an isolated marker
  valid[max(1, round(clean$rc[k]) - 7):min(H, round(clean$rc[k]) + 7),
        max(1, round(clean$cc[k]) - 7):min(W, round(clean$cc[k]) + 7)] <- FALSE
valid <- valid & !in_zone(px2x(col(dark)), px2y(row(dark))) & px2y(row(dark)) <= 100
footprints <- lapply(templates, function(tm) dilate(tm >= 0.5, 1))
det <- NULL; M <- mask
repeat {
  sc <- sapply(maps, function(m) max(m[valid]))
  if (max(sc) < 0.5) break
  ty <- names(maps)[which.max(sc)]
  p <- which(maps[[ty]] == max(sc) & valid, arr.ind = TRUE)[1, ]
  alt <- sapply(maps, function(m) max(m[max(1, p[1] - 2):min(H, p[1] + 2), max(1, p[2] - 2):min(W, p[2] + 2)]))
  det <- rbind(det, data.frame(type = ty, rc = p[1], cc = p[2], score = max(sc),
                               runner_up = names(alt)[order(-alt)][2], runner_up_score = sort(alt, decreasing = TRUE)[2]))
  fi <- p[1] + (-r:r); fj <- p[2] + (-r:r); ok_i <- fi >= 1 & fi <= H; ok_j <- fj >= 1 & fj <= W
  Msub <- M[fi[ok_i], fj[ok_j]]; Msub[footprints[[ty]][ok_i, ok_j]] <- 0; M[fi[ok_i], fj[ok_j]] <- Msub
  valid[max(1, p[1] - 5):min(H, p[1] + 5), max(1, p[2] - 5):min(W, p[2] + 5)] <- FALSE
  wi <- max(1, p[1] - 2 * TS):min(H, p[1] + 2 * TS); wj <- max(1, p[2] - 2 * TS):min(W, p[2] + 2 * TS)
  for (nm in names(maps)) maps[[nm]][wi, wj] <- masked_ncc(I[wi, wj], M[wi, wj], templates[[nm]])
}
det$x <- px2x(det$cc); det$y <- px2y(det$rc)
cat("Detections in cluttered regions (best type, runner-up):\n")
print(det, digits = 3, row.names = FALSE)


## ---- 6. flag overlapping detections and apply visual overrides -------------
det$flag <- sapply(seq_len(nrow(det)), function(k) {
  dd <- sqrt((det$rc[k] - det$rc)^2 + (det$cc[k] - det$cc)^2); any(dd > 0 & dd < 12)
})
det$override <- FALSE
for (k in seq_len(nrow(overrides))) {
  j <- which(det$flag & abs(det$x - overrides$x[k]) < 1.5 & abs(det$y - overrides$y[k]) < 1.5)
  stopifnot(length(j) == 1)
  det$type[j] <- overrides$type[k]; det$override[j] <- TRUE
}
cat("Markers located by template matching:", nrow(det), "\n")

## ---- 7. assemble, check and save --------------------------------------------
thorstensson1977 <- rbind(
  data.frame(group = clean$type, ft_area = clean$x, peak_torque = clean$y,
             method = "shape", visually_confirmed = FALSE, x_px = clean$cc, y_px = clean$rc),
  data.frame(group = det$type, ft_area = det$x, peak_torque = det$y,
             method = "template", visually_confirmed = det$flag, x_px = det$cc, y_px = det$rc)
)
thorstensson1977$ft_area <- round(thorstensson1977$ft_area, 1)
thorstensson1977$peak_torque <- round(thorstensson1977$peak_torque, 1)
thorstensson1977 <- thorstensson1977[order(thorstensson1977$group, thorstensson1977$ft_area), ]
rownames(thorstensson1977) <- NULL
stopifnot(nrow(thorstensson1977) == expected_n)
print(table(thorstensson1977$group))
digit_fit <- lm(peak_torque ~ ft_area, thorstensson1977)
cat(sprintf("Regression on digitised data: y = %.2f x + %.1f, r = %.2f (caption: y = 0.30 x + 44, r = 0.48)\n",
            coef(digit_fit)[2], coef(digit_fit)[1], cor(thorstensson1977$ft_area, thorstensson1977$peak_torque)))
write.csv(thorstensson1977, out_csv, row.names = FALSE)

## diagnostic figure: left = scan with axis layout and detections, right = digitised data
groups <- c(sprinter = "Sprinters (filled circle)", downhill_skier = "Downhill skiers (triangle)",
            race_walker = "Race walkers (star)", orienteer = "Orienteers (small open circle)",
            sedentary = "Sedentary men (large open circle)")
cols <- c(sprinter = "#D55E00", downhill_skier = "#0072B2", race_walker = "#009E73",
          orienteer = "#CC79A7", sedentary = "#E69F00")
pchs <- c(sprinter = 16, downhill_skier = 17, race_walker = 8, orienteer = 1, sedentary = 1)
cexs <- c(sprinter = 1.2, downhill_skier = 1.2, race_walker = 1.1, orienteer = 1.1, sedentary = 1.9)
png(out_png, width = 2 * W + 60, height = H + 40, res = 110)
layout(matrix(1:2, 1), widths = c(W + 30, W + 30))
par(mar = c(0, 0, 2, 0))
plot(NA, xlim = c(0, W), ylim = c(H, 0), asp = 1, axes = FALSE, xlab = "", ylab = "",
     main = "Scan: axis layout and identified points")
rasterImage(img, 0, H, W, 0)
abline(h = xax, v = yax, col = "#00A000", lwd = 1.5)
segments(xt$cc, xax, xt$cc, xax - 20, col = "#00A000", lwd = 2)
segments(yax, yt$rc, yax + 20, yt$rc, col = "#00A000", lwd = 2)
text(xt$cc, xax + 12, seq(20, 100, 20), col = "#00A000", cex = 0.7, font = 2)
text(yax - 14, yt$rc, seq(20, 100, 20), col = "#00A000", cex = 0.7, font = 2)
for (k in seq_len(nrow(exclusion_zones))) with(exclusion_zones[k, ],
  rect(x2px(xmin), y2px(ymin), x2px(xmax), y2px(ymax), col = adjustcolor("grey50", 0.25), border = "grey40", lty = 3))
abline(coef(lfit)[1], coef(lfit)[2], col = "#FF7F00", lty = 2)
with(thorstensson1977, {
  symbols(x_px, y_px, circles = rep(9, length(x_px)), inches = FALSE, add = TRUE,
          fg = cols[group], lwd = ifelse(visually_confirmed, 2.5, 1.5), lty = ifelse(visually_confirmed, 3, 1))
  text(x_px + 9, y_px - 9, seq_along(x_px), cex = 0.5, col = cols[group])
})
legend("bottomright", inset = c(0.02, 0.08), bty = "n", cex = 0.7,
       legend = c(groups, "axes and ticks (calibration)", "fitted regression line", "text zones ignored", "dotted ring: overlapping marker, type confirmed visually"),
       col = c(cols, "#00A000", "#FF7F00", "grey40", "black"),
       lty = c(1, 1, 1, 1, 1, 1, 2, 3, 3), lwd = c(rep(1.5, 5), 1.5, 1, 1, 2.5), pch = c(rep(1, 5), NA, NA, 15, NA),
       pt.cex = c(rep(1.5, 5), 1, 1, 1.5, 1))
par(mar = c(4, 4.5, 2, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 100), xlab = "% FT area", ylab = "Peak torque, % MVC (180 degrees/s)",
     main = "Digitised data", las = 1)
abline(44, 0.30, lty = 2, col = "grey50")
abline(digit_fit, col = "#FF7F00", lty = 2)
with(thorstensson1977, points(ft_area, peak_torque, pch = pchs[group], cex = cexs[group], col = cols[group]))
legend("bottomright", bty = "n", cex = 0.7, legend = c(groups, "caption: y = 0.30x + 44", "fit to digitised data"),
       col = c(cols, "grey50", "#FF7F00"), pch = c(pchs, NA, NA), pt.cex = c(cexs, 1, 1), lty = c(rep(NA, 5), 2, 2))
dev.off()
cat("Wrote", out_csv, "and", out_png, "\n")
