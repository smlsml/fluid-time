== April 12, 2012 @ 09:22 AM PDT
====[FluidTime.new('2012/04/12 9:22').month.day.th.sc.ss.year.txt('@').time.xz.pm.zone.to_s]

Making it ready for the first release:

* Added xs - strips space (renamed from ns)
* Added xz - strips leading 0 or :00
* Removed aliases for times without leading zeros, use xz
* Now works outside of rails (.th doesn't work without it though)
* Added sp, sc, sl, sn, ss aliases for making symbols
