def get_fingerprint_sql(sql)
    finger_sql = sql.gsub(/\\["']/, '')
    finger_sql.gsub!(/".*?"/s, '?')
    finger_sql.gsub!(/'.*?'/s, '?')
    finger_sql.gsub!(/\bfalse\b|\btrue\b/is, '?')
    finger_sql.gsub!(/[0-9+-][0-9a-f.xb+-]*/, '?')
    finger_sql.gsub!(/[xb.+-]\?/, '?')
    finger_sql.strip!
    finger_sql.chomp!
    finger_sql.gsub!(/\s+/, ' ')
    finger_sql.downcase!
    finger_sql.gsub!(/\bnull\b/, '?')
    finger_sql.gsub!(/\b(in|values?)(?:[\s,]*\([\s?,]*\))+/x, "\\1(?+)")
    finger_sql.gsub!(/\b(select\s.*?)(?:(\sunion(?:\sall)?)\s\1)+/x, "\\1 /*repeat$2*/")
    finger_sql.gsub!(/\blimit \?(?:, ?\?| offset \?)?/, 'limit ?')
    if finger_sql =~ /\bORDER BY /i
      while (1)
        finger_sql.gsub!(/\G(.+?)\s+ASC/i, "\\1")
        if finger_sql !=~ /\G(.+?)\s+ASC/i
          break
        end
      end
    end
    return finger_sql
end
