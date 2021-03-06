require "date"
require "time"

class FluidTime

  def initialize(input = Time.now)
    @build = ""
    @last_was_space = false

    @time = nil
    @time = input if input.is_a?(Time)
    @time = input.to_time if input.is_a?(Date) && input.methods.include?(:to_time)
    @time = Time.parse(input.to_s) if @time.nil?
  end

  def self.demo
    %w{
      to_time
      to_date
      a.ddd.wday
      A.tday.weekday
      b.mmm.smonth
      B.month
      c
      full
      d.dd.day.num
      e.mday
      H.h24.mhour.hour24
      I.h12.hour.hour12
      l
      j.yday.day_of_year
      m.mm.mon.month_of_year
      M.min.minute
      hour.p
      hour.pm.txt('or').hour.am
      hour.PM.txt('or').hour.AM
      S.sec.second
      U
      W
      w
      x.autodate
      X.autotime
      y.yy.sy
      Y.year
      Z.zone.timezone
      date
      time
      db
      usdate
      W.th.comma.space._('week')
      date.hour.colon.min.today.pm
      year.mmm.d.th
      time.xs.p.down
      txt('01').xz.PM.zone
      txt('1:00').xz.pm.zone
      _('braces').lb.lp.lc.rc.rp.rb
      _('symbols').lb.tp.ts.tc.ts.tn.ts.td.rb
      _('symbols').lb.sp.ss.sc.ss.sn.ss.sd.rb
      period.space.comma
      colon.space.dash.space.slash
    }.each {|ex| "FluidTime.new.   #{ex}.to_s".tap {|str| p str + (" %#{80 - str.length}s" % eval(str))} }
    nil
  end


  ##### Helpers


  def to_s
    hold = @build.strip
    @build = ""
    '' == hold ? @time.to_s : hold
  end

  def to_time
    @time
  end

  def to_date
    Date.new(@time.year, @time.month, @time.day)
  end

  def <=>(o)
    self.to_s <=> o.to_s
  end

  def cat(str, sep = ' ')
    @last_was_space = ' ' == str.to_s
    @build += str.to_s + sep
    self
  end
  alias :txt :cat
  alias :_ :cat
  
  def set(str, sep = ' ')
    @build = str.to_s + sep
    self
  end


  ##### Formats

  def a; cat @time.strftime('%a') end      # %a - The abbreviated weekday name (``Sun'')
  alias :ddd :a
  alias :wday :a


  def A; cat @time.strftime('%A') end      # %A - The  full  weekday  name (``Sunday'')
  alias :tday :A
  alias :weekday :A


  def b; cat @time.strftime('%b') end      # %b - The abbreviated month name (``Jan'')
  alias :mmm :b
  alias :smonth :b


  def B; cat @time.strftime('%B') end      # %B - The  full  month  name (``January'')
  alias :month :B


  def c; cat @time.strftime('%c') end      # %c - The preferred local date and time representation
  alias :full :c


  def d; cat @time.strftime('%d') end      # %d - Day of the month (01..31)
  alias :dd :d
  alias :day :d
  alias :num :d


  def e; cat @time.strftime('%e') end      # %e - Day of the month (1..31)
  alias :mday :e                           # included for completeness, should use day.xz (strip zero)


  def H; cat @time.strftime('%H') end      # %H - Hour of the day, 24-hour clock (00..23)
  alias :h24 :H                            # use h24.xz to remove leading zero
  alias :mhour :H
  alias :hour24 :H


  def I; cat @time.strftime('%I') end      # %I - Hour of the day, 12-hour clock (01..12)
  alias :h12 :I                            # use h12.xz to remove leading zero
  alias :hour :I
  alias :hour12 :I


  def l; cat @time.strftime('%l') end      # %l - hour, 12-hour clock, blank-padded ( 0..12)
                                           # included for completeness, should just use hour.xz (strip zero)


  def j; cat @time.strftime('%j') end      # %j - Day of the year (001..366)
  alias :yday :j
  alias :day_of_year :j


  def m; cat @time.strftime('%m') end      # %m - Month of the year (01..12)
  alias :mm :m
  alias :mon :m
  alias :month_of_year :m


  def M; cat @time.strftime('%M') end      # %M - Minute of the hour (00..59)
  alias :min :M
  alias :minute :M


  def p; cat @time.strftime('%p') end      # %p - Meridian indicator (``AM''  or  ``PM'')
  alias :AM :p
  alias :PM :p

  def pm; self.p.down end                  # lowercase am/pm
  alias :am :pm

  def xpm; self.xz.xs.pm end               # lowercase am/pm without space or leading zero on preceding number
  alias :xam :xpm


  def S; cat @time.strftime('%S') end      # %S - Second of the minute (00..60)
  alias :sec :S
  alias :second :S


  def U; cat @time.strftime('%U') end      # %U - Week number of the current year,
                                           #      starting with the first Sunday
                                           #                 as the first day
                                           #                 of the first week (00..53)


  def W; cat @time.strftime('%W') end      # %W - Week number of the current year,
                                           #       starting with the first Monday
                                           #                  as the first day
                                           #                  of the first week (00..53)



  def w; cat @time.strftime('%w') end      # %w - Day of the week (Sunday is 0, 0..6)


  def x; cat @time.strftime('%x') end      # %x - Preferred representation for the date alone, no time
  alias :autodate :x


  def X; cat @time.strftime('%X') end      # %X - Preferred representation for the time alone, no date
  alias :autotime :X


  def y; cat @time.strftime('%y') end      # %y - Year without a century (00..99)
  alias :yy :y
  alias :sy :y


  def Y; cat @time.strftime('%Y') end      # %Y - Year with century
  alias :year :Y


  def Z; cat @time.strftime('%Z') end      # %Z - Time zone name
  alias :zone :Z
  alias :timezone :Z


  ##### Modifiers

  def th
    set(@build.strip.split.tap do |parts|
      parts << parts.pop.tap { |last| last.replace(numeric?(last) ? ordinalize(last) : last) }
    end.join(' '))
  end

  def ytt
    set(@build.gsub('-', '/').split.tap do |parts|
      parts.each_with_index do |part, index|
        date = Date.parse(part) rescue nil
        parts[index] = 'Today' if date.is_a?(Date) && date.to_s == Date.today.to_s
        parts[index] = 'Tomorrow' if date.is_a?(Date) && date.to_s == (Date.today + 1).to_s
        parts[index] = 'Yesterday' if date.is_a?(Date) && date.to_s == (Date.today - 1).to_s
      end
    end.join(' '))
  end
  alias :today :ytt
  alias :tomorrow :ytt
  alias :yesterday :ytt

  def down
    set(@build.split.tap {|parts| parts << parts.pop.downcase}.join(' '))
  end
  alias :lower :down

  def up
    set(@build.split.tap {|parts| parts << parts.pop.upcase}.join(' '))
  end
  alias :upper :up

  def strip_zero
    set(@build.strip.split.tap do |parts|
      parts << parts.pop.tap { |last| last.replace(last.gsub(/^0/,'').gsub(':00','')) }
    end.join(' '))
  end
  alias :xz :strip_zero
  alias :x0 :strip_zero
  alias :nozero :strip_zero

  def strip
    @build.strip! unless @last_was_space
    self
  end
  alias :xs :strip


  ##### Symbols (couldn't decide between: t for text and s for symbol)

  def space;     txt ' ',''  end; alias :ts :space;   alias :ss :space
  def period; xs.txt '.', '' end; alias :tp :period;  alias :sp :period
  def comma;  xs.txt ',', '' end; alias :tc :comma;   alias :sc :comma
  def colon;  xs.txt ':', '' end; alias :tn :colon;   alias :sn :colon
  def dash;   xs.txt '-', '' end; alias :td :dash;    alias :sd :dash
  def slash;  xs.txt '/', '' end; alias :tl :slash;   alias :sl :slash

  def lbrace;  xs.txt '[', '' end; alias :lb :lbrace
  def rbrace;  xs.txt ']', '' end; alias :rb :rbrace

  def lcurve;  xs.txt '{', '' end; alias :lc :lcurve
  def rcurve;  xs.txt '}', '' end; alias :rc :rcurve

  def lparen;  xs.txt '(', '' end; alias :lp :lparen
  def rparen;  xs.txt ')', '' end; alias :rp :rparen


  ##### Presets

  def db
    self.Y.m.d.H.I.S
  end

  def usdate
    self.mm.slash.d.slash.Y
  end

  def Ymd
    self.Y.xs.mm.xs.d
  end

  def Y_m_d
    self.Y.dash.mm.dash.d
  end

  def time
    self.hour.colon.minute.colon.second
  end

  def date
    self.mon.slash.day.slash.year
  end

  #####


  private

  def numeric?(string)
    true if Float(string) rescue false
  end

  def ordinalize(number)
    return "#{number}th" if (11..13).include?(number.to_i % 100)

    case number.to_i % 10
      when 1; "#{number}st"
      when 2; "#{number}nd"
      when 3; "#{number}rd"
      else    "#{number}th"
    end
  end

end