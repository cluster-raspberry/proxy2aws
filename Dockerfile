#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
FROM									\
	nginx@sha256:676b8117782d9e8c20af8e1b19356f64acc76c981f3a65c66e33a9874877892a \
		AS nginx
#########################################################################
RUN									\
	for package in							\
		$(							\
			for x in 0 1 2 3 4 5 6 7 8 9;			\
			do						\
				apk list				\
					| awk /nginx/'{ print $1 }'	\
					| awk -F-$x  '{ print $1 }'	\
					| grep -v '\-[0-9]';		\
			done						\
				| sort					\
				| uniq					\
				| grep -v ^nginx$			\
		);							\
	do								\
		apk del $package;					\
	done
#########################################################################
RUN									\
	rm -rf /etc/nginx/conf.d					\
		&& ln -s /run/secrets/etc/nginx/conf.d /etc/nginx
#########################################################################
