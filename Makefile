# $NetBSD: Makefile,v 1.27 2020/11/19 09:35:38 schmonz Exp $

DISTNAME=		cdb-0.75
CATEGORIES=		databases
MASTER_SITES=		http://cr.yp.to/cdb/

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://cr.yp.to/cdb.html
COMMENT=		Creates and reads constant databases
LICENSE=		public-domain

CONFLICTS+=		tinycdb-[0-9]*

SUBST_CLASSES+=		djberrno

INSTALLATION_DIRS=	bin include lib

do-install:
	for prog in cdbdump cdbget cdbmake cdbstats cdbtest; do \
	${INSTALL_PROGRAM} ${WRKSRC}/$$prog ${DESTDIR}${PREFIX}/bin; \
	done
	${INSTALL_SCRIPT} ${WRKSRC}/cdbmake-12 ${DESTDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/cdbmake-sv ${DESTDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/cdb.h ${DESTDIR}${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/cdb.a ${DESTDIR}${PREFIX}/lib/libcdb.a

.include "../../mk/djbware.mk"
.include "../../mk/bsd.pkg.mk"
