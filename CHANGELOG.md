# FluidTime Changelog

## [0.2.1] April 11th, 2012 @ 1:38pm PDT
    FluidTime.new('2012/04/11 13:38').month.day.th.sc.ss.year.txt('@').time.xz.xs.pm.down.zone.to_s

- Documentation improvements
- Re-order elements in FluidTime.demo
- Removed dashes and colons from the .db preset
- Remove reliance on Date.tomorrow and Date.yesterday (was broken without rails)

# [0.1.x] April 10th, 2012 @ 21:22 PM PDT
    FluidTime.new('2012/04/10 21:22').month.day.th.sc.ss.year.txt('@').time.xz.pm.zone.to_s

Making it ready for the first release:

- Added xs - strips space (renamed from ns)
- Added xz - strips leading 0 or :00
- Removed aliases for times without leading zeros, use xz
- Now works outside of rails (.th doesn't work without it though)
- Added sp, sc, sl, sn, ss aliases for making symbols
