# Changelog

## [8.0.0](https://github.com/camptocamp/docker-mapserver/tree/8.0.0) (2022-09-12)

[Full Changelog](https://github.com/camptocamp/docker-mapserver/compare/7.6.0...8.0.0)

#### :sparkles: Enhancements

- Add landing page - RFC-134 - Fix master [\#256](https://github.com/camptocamp/docker-mapserver/pull/256) ([sbrunner](https://github.com/sbrunner))
- Remove entrypoint and confd [\#250](https://github.com/camptocamp/docker-mapserver/pull/250) ([sbrunner](https://github.com/sbrunner))
- Fix master branch, add configuration file [\#227](https://github.com/camptocamp/docker-mapserver/pull/227) ([sbrunner](https://github.com/sbrunner))
- Add 7.6 version base on gdal:ubuntu-small-3.3.2 [\#211](https://github.com/camptocamp/docker-mapserver/pull/211) ([sbrunner](https://github.com/sbrunner))
- Add default value for MS_MAP_PATTERN [\#124](https://github.com/camptocamp/docker-mapserver/pull/124) ([sbrunner](https://github.com/sbrunner))
- \[Backport master\] Use Ubuntu 20.04 [\#73](https://github.com/camptocamp/docker-mapserver/pull/73) ([c2c-bot-gis-ci](https://github.com/c2c-bot-gis-ci))
- Enable use_proj and tile mode \#61 [\#62](https://github.com/camptocamp/docker-mapserver/pull/62) ([ivorbosloper](https://github.com/ivorbosloper))
- Dockerfile: add support for optional build against OracleSpatial client library [\#60](https://github.com/camptocamp/docker-mapserver/pull/60) ([rouault](https://github.com/rouault))
- Use GDAL as base image [\#58](https://github.com/camptocamp/docker-mapserver/pull/58) ([sbrunner](https://github.com/sbrunner))

#### :bug: Bug Fixes

- Fix dash in MS_MAP_PATTERN [\#172](https://github.com/camptocamp/docker-mapserver/pull/172) ([sbrunner](https://github.com/sbrunner))
- Add missing file [\#164](https://github.com/camptocamp/docker-mapserver/pull/164) ([sbrunner](https://github.com/sbrunner))
- Add the missing escapes [\#154](https://github.com/camptocamp/docker-mapserver/pull/154) ([sbrunner](https://github.com/sbrunner))
- Fix typo in MS_MAP_PATTERN regexp [\#144](https://github.com/camptocamp/docker-mapserver/pull/144) ([yjacolin](https://github.com/yjacolin))
- Fix exposed port [\#94](https://github.com/camptocamp/docker-mapserver/pull/94) ([sbrunner](https://github.com/sbrunner))
- start-server: run apache2 under exec so that 'docker stop' SIGTERM signal is well propagated [\#63](https://github.com/camptocamp/docker-mapserver/pull/63) ([rouault](https://github.com/rouault))

#### :books: Documentation

- Add generated changelog [\#295](https://github.com/camptocamp/docker-mapserver/pull/295) ([sbrunner](https://github.com/sbrunner))

#### :wrench: Build, CI, Tests, Code style

- Fix the changelog generator workflow [\#326](https://github.com/camptocamp/docker-mapserver/pull/326) ([sbrunner](https://github.com/sbrunner))
- Clean all the images already present in the image given by GitHub [\#325](https://github.com/camptocamp/docker-mapserver/pull/325) ([sbrunner](https://github.com/sbrunner))
- Update the changelog generation workflow [\#324](https://github.com/camptocamp/docker-mapserver/pull/324) ([sbrunner](https://github.com/sbrunner))
- Update the Renovate configuration [\#323](https://github.com/camptocamp/docker-mapserver/pull/323) ([sbrunner](https://github.com/sbrunner))
- Remove Dependabot configuration [\#322](https://github.com/camptocamp/docker-mapserver/pull/322) ([sbrunner](https://github.com/sbrunner))
- Update the changelog [\#314](https://github.com/camptocamp/docker-mapserver/pull/314) ([github-actions[bot]](https://github.com/apps/github-actions))
- Update the changelog [\#302](https://github.com/camptocamp/docker-mapserver/pull/302) ([github-actions[bot]](https://github.com/apps/github-actions))
- Fix the changelog generation [\#301](https://github.com/camptocamp/docker-mapserver/pull/301) ([sbrunner](https://github.com/sbrunner))
- Update the changelog [\#299](https://github.com/camptocamp/docker-mapserver/pull/299) ([github-actions[bot]](https://github.com/apps/github-actions))
- Use Poetry instead of Pipenv [\#288](https://github.com/camptocamp/docker-mapserver/pull/288) ([sbrunner](https://github.com/sbrunner))
- Don't run 2 CI jobs in a pull request [\#283](https://github.com/camptocamp/docker-mapserver/pull/283) ([sbrunner](https://github.com/sbrunner))
- Configure Renovate [\#281](https://github.com/camptocamp/docker-mapserver/pull/281) ([sbrunner](https://github.com/sbrunner))
- Upgrade for Python 3.6 \(with pyupgrade\) [\#191](https://github.com/camptocamp/docker-mapserver/pull/191) ([sbrunner](https://github.com/sbrunner))
- Test MapServer with MAP [\#159](https://github.com/camptocamp/docker-mapserver/pull/159) ([sbrunner](https://github.com/sbrunner))
- Fix dependabot config [\#102](https://github.com/camptocamp/docker-mapserver/pull/102) ([sbrunner](https://github.com/sbrunner))
- Remove unused [\#101](https://github.com/camptocamp/docker-mapserver/pull/101) ([sbrunner](https://github.com/sbrunner))
- Fix rebuild [\#93](https://github.com/camptocamp/docker-mapserver/pull/93) ([sbrunner](https://github.com/sbrunner))
- python3-wheel already installed [\#91](https://github.com/camptocamp/docker-mapserver/pull/91) ([c2c-bot-gis-ci](https://github.com/c2c-bot-gis-ci))
- Use c2cciutils [\#83](https://github.com/camptocamp/docker-mapserver/pull/83) ([c2c-bot-gis-ci](https://github.com/c2c-bot-gis-ci))
- \[Backport master\] Publish Docker images to GitHub Container Registry [\#78](https://github.com/camptocamp/docker-mapserver/pull/78) ([c2c-bot-gis-ci](https://github.com/c2c-bot-gis-ci))
- \[Backport master\] Fix clean Docker hub tags [\#72](https://github.com/camptocamp/docker-mapserver/pull/72) ([c2c-bot-gis-ci](https://github.com/c2c-bot-gis-ci))
- \[Backport master\] Use secret defined in organization [\#68](https://github.com/camptocamp/docker-mapserver/pull/68) ([c2c-bot-gis-ci](https://github.com/c2c-bot-gis-ci))
- \[Backport master\] Add Clean docker hub tags workflow [\#67](https://github.com/camptocamp/docker-mapserver/pull/67) ([c2c-bot-gis-ci](https://github.com/c2c-bot-gis-ci))
- Never push on latest branch, use apt instead apt-get, code style [\#59](https://github.com/camptocamp/docker-mapserver/pull/59) ([sbrunner](https://github.com/sbrunner))

#### :package: Dependencies update

- Update dependency c2cwsgiutils to v5.1.5 [\#329](https://github.com/camptocamp/docker-mapserver/pull/329) ([renovate[bot]](https://github.com/apps/renovate))
- Lock file maintenance [\#328](https://github.com/camptocamp/docker-mapserver/pull/328) ([renovate[bot]](https://github.com/apps/renovate))
- Update dependency poetry to v1.2.0 [\#321](https://github.com/camptocamp/docker-mapserver/pull/321) ([renovate[bot]](https://github.com/apps/renovate))
- Update all patch versions \(patch\) [\#320](https://github.com/camptocamp/docker-mapserver/pull/320) ([renovate[bot]](https://github.com/apps/renovate))
- Lock file maintenance [\#319](https://github.com/camptocamp/docker-mapserver/pull/319) ([renovate[bot]](https://github.com/apps/renovate))
- Lock file maintenance [\#316](https://github.com/camptocamp/docker-mapserver/pull/316) ([renovate[bot]](https://github.com/apps/renovate))
- Update osgeo/gdal Docker tag to vubuntu-small-3.5.1 [\#315](https://github.com/camptocamp/docker-mapserver/pull/315) ([renovate[bot]](https://github.com/apps/renovate))
- Update camptocamp/postgres Docker tag to v14 [\#312](https://github.com/camptocamp/docker-mapserver/pull/312) ([renovate[bot]](https://github.com/apps/renovate))
- Update dependency poetry to v1.1.15 [\#310](https://github.com/camptocamp/docker-mapserver/pull/310) ([renovate[bot]](https://github.com/apps/renovate))
- Lock file maintenance [\#308](https://github.com/camptocamp/docker-mapserver/pull/308) ([renovate[bot]](https://github.com/apps/renovate))
- Update dependency c2cciutils to v1.2.1 [\#307](https://github.com/camptocamp/docker-mapserver/pull/307) ([renovate[bot]](https://github.com/apps/renovate))
- Lock file maintenance [\#306](https://github.com/camptocamp/docker-mapserver/pull/306) ([renovate[bot]](https://github.com/apps/renovate))
- Lock file maintenance [\#303](https://github.com/camptocamp/docker-mapserver/pull/303) ([renovate[bot]](https://github.com/apps/renovate))
- Update dependency camptocamp/postgres to v11 [\#300](https://github.com/camptocamp/docker-mapserver/pull/300) ([renovate[bot]](https://github.com/apps/renovate))
- Lock file maintenance [\#298](https://github.com/camptocamp/docker-mapserver/pull/298) ([renovate[bot]](https://github.com/apps/renovate))
- Update dependency c2cwsgiutils to v5.1.0 [\#297](https://github.com/camptocamp/docker-mapserver/pull/297) ([renovate[bot]](https://github.com/apps/renovate))
- Update dependency poetry to v1.1.14 [\#296](https://github.com/camptocamp/docker-mapserver/pull/296) ([renovate[bot]](https://github.com/apps/renovate))
- Lock file maintenance [\#294](https://github.com/camptocamp/docker-mapserver/pull/294) ([renovate[bot]](https://github.com/apps/renovate))
- Update actions/checkout action to v3 [\#293](https://github.com/camptocamp/docker-mapserver/pull/293) ([renovate[bot]](https://github.com/apps/renovate))
- Update all patch versions [\#292](https://github.com/camptocamp/docker-mapserver/pull/292) ([renovate[bot]](https://github.com/apps/renovate))
- Update dependency c2cciutils to v1.2.dev20220617064142 [\#287](https://github.com/camptocamp/docker-mapserver/pull/287) ([renovate[bot]](https://github.com/apps/renovate))
- Lock file maintenance [\#286](https://github.com/camptocamp/docker-mapserver/pull/286) ([renovate[bot]](https://github.com/apps/renovate))
- Update dependency requests to v2.28.0 [\#285](https://github.com/camptocamp/docker-mapserver/pull/285) ([renovate[bot]](https://github.com/apps/renovate))
- Update dependency c2cciutils to v1.2.dev20220609220245 [\#284](https://github.com/camptocamp/docker-mapserver/pull/284) ([renovate[bot]](https://github.com/apps/renovate))
- Bump c2cciutils from 1.2.dev20220215091734 to 1.2.dev20220607092206 in /ci [\#280](https://github.com/camptocamp/docker-mapserver/pull/280) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump pipenv from 2022.1.8 to 2022.6.7 in /acceptance_tests [\#279](https://github.com/camptocamp/docker-mapserver/pull/279) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump lxml from 4.8.0 to 4.9.0 in /acceptance_tests [\#278](https://github.com/camptocamp/docker-mapserver/pull/278) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump osgeo/gdal from ubuntu-small-3.4.1 to ubuntu-small-3.5.0 [\#277](https://github.com/camptocamp/docker-mapserver/pull/277) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump pytest from 7.0.1 to 7.1.2 in /acceptance_tests [\#273](https://github.com/camptocamp/docker-mapserver/pull/273) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump ubuntu from 20.04 to 22.04 in /acceptance_tests [\#271](https://github.com/camptocamp/docker-mapserver/pull/271) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump lxml from 4.7.1 to 4.8.0 in /acceptance_tests [\#261](https://github.com/camptocamp/docker-mapserver/pull/261) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.2.dev20220214124120 to 1.2.dev20220215091734 in /ci [\#260](https://github.com/camptocamp/docker-mapserver/pull/260) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.2.dev20220209105112 to 1.2.dev20220214124120 in /ci [\#259](https://github.com/camptocamp/docker-mapserver/pull/259) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump pytest from 7.0.0 to 7.0.1 in /acceptance_tests [\#257](https://github.com/camptocamp/docker-mapserver/pull/257) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.2.dev20220208134628 to 1.2.dev20220209105112 in /ci [\#253](https://github.com/camptocamp/docker-mapserver/pull/253) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.2.dev20220207125831 to 1.2.dev20220208134628 in /ci [\#251](https://github.com/camptocamp/docker-mapserver/pull/251) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cwsgiutils from 4.1.4 to 5.0.0 in /acceptance_tests [\#249](https://github.com/camptocamp/docker-mapserver/pull/249) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20220203110559 to 1.2.dev20220207125831 in /ci [\#248](https://github.com/camptocamp/docker-mapserver/pull/248) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump pytest from 6.2.5 to 7.0.0 in /acceptance_tests [\#247](https://github.com/camptocamp/docker-mapserver/pull/247) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20220202080326 to 1.1.dev20220203110559 in /ci [\#246](https://github.com/camptocamp/docker-mapserver/pull/246) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20220131090250 to 1.1.dev20220202080326 in /ci [\#245](https://github.com/camptocamp/docker-mapserver/pull/245) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20220124152826 to 1.1.dev20220131090250 in /ci [\#243](https://github.com/camptocamp/docker-mapserver/pull/243) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20220120144445 to 1.1.dev20220124152826 in /ci [\#242](https://github.com/camptocamp/docker-mapserver/pull/242) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20220119105226 to 1.1.dev20220120144445 in /ci [\#241](https://github.com/camptocamp/docker-mapserver/pull/241) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20220105162844 to 1.1.dev20220119105226 in /ci [\#240](https://github.com/camptocamp/docker-mapserver/pull/240) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump pipenv from 2021.11.23 to 2022.1.8 in /acceptance_tests [\#239](https://github.com/camptocamp/docker-mapserver/pull/239) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump osgeo/gdal from ubuntu-small-3.4.0 to ubuntu-small-3.4.1 [\#238](https://github.com/camptocamp/docker-mapserver/pull/238) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump requests from 2.27.0 to 2.27.1 in /acceptance_tests [\#236](https://github.com/camptocamp/docker-mapserver/pull/236) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211215101636 to 1.1.dev20220105162844 in /ci [\#235](https://github.com/camptocamp/docker-mapserver/pull/235) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump requests from 2.26.0 to 2.27.0 in /acceptance_tests [\#232](https://github.com/camptocamp/docker-mapserver/pull/232) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211209145632 to 1.1.dev20211215101636 in /ci [\#231](https://github.com/camptocamp/docker-mapserver/pull/231) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump lxml from 4.6.5 to 4.7.1 in /acceptance_tests [\#230](https://github.com/camptocamp/docker-mapserver/pull/230) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump lxml from 4.6.4 to 4.6.5 in /acceptance_tests [\#229](https://github.com/camptocamp/docker-mapserver/pull/229) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211125140927 to 1.1.dev20211209145632 in /ci [\#228](https://github.com/camptocamp/docker-mapserver/pull/228) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211022130135 to 1.1.dev20211125140927 in /ci [\#226](https://github.com/camptocamp/docker-mapserver/pull/226) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump pipenv from 2021.5.29 to 2021.11.23 in /acceptance_tests [\#225](https://github.com/camptocamp/docker-mapserver/pull/225) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump osgeo/gdal from ubuntu-small-3.3.2 to ubuntu-small-3.4.0 [\#222](https://github.com/camptocamp/docker-mapserver/pull/222) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump lxml from 4.6.3 to 4.6.4 in /acceptance_tests [\#218](https://github.com/camptocamp/docker-mapserver/pull/218) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211021112135 to 1.1.dev20211022130135 in /ci [\#217](https://github.com/camptocamp/docker-mapserver/pull/217) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211019114043 to 1.1.dev20211021112135 in /ci [\#216](https://github.com/camptocamp/docker-mapserver/pull/216) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211012114625 to 1.1.dev20211019114043 in /ci [\#215](https://github.com/camptocamp/docker-mapserver/pull/215) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211008145734 to 1.1.dev20211012114625 in /ci [\#214](https://github.com/camptocamp/docker-mapserver/pull/214) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211007121148 to 1.1.dev20211008145734 in /ci [\#213](https://github.com/camptocamp/docker-mapserver/pull/213) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211006140719 to 1.1.dev20211007121148 in /ci [\#212](https://github.com/camptocamp/docker-mapserver/pull/212) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20211004142851 to 1.1.dev20211006140719 in /ci [\#210](https://github.com/camptocamp/docker-mapserver/pull/210) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210921153209 to 1.1.dev20211004142851 in /ci [\#209](https://github.com/camptocamp/docker-mapserver/pull/209) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210915084344 to 1.1.dev20210921153209 in /ci [\#208](https://github.com/camptocamp/docker-mapserver/pull/208) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210913073441 to 1.1.dev20210915084344 in /ci [\#207](https://github.com/camptocamp/docker-mapserver/pull/207) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210903085429 to 1.1.dev20210913073441 in /ci [\#206](https://github.com/camptocamp/docker-mapserver/pull/206) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump osgeo/gdal from ubuntu-small-3.3.1 to ubuntu-small-3.3.2 [\#205](https://github.com/camptocamp/docker-mapserver/pull/205) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210902094954 to 1.1.dev20210903085429 in /ci [\#204](https://github.com/camptocamp/docker-mapserver/pull/204) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210901090041 to 1.1.dev20210902094954 in /ci [\#203](https://github.com/camptocamp/docker-mapserver/pull/203) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210810100526 to 1.1.dev20210901090041 in /ci [\#202](https://github.com/camptocamp/docker-mapserver/pull/202) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump pytest from 6.2.4 to 6.2.5 in /acceptance_tests [\#201](https://github.com/camptocamp/docker-mapserver/pull/201) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210729075943 to 1.1.dev20210810100526 in /ci [\#200](https://github.com/camptocamp/docker-mapserver/pull/200) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210727151149 to 1.1.dev20210729075943 in /ci [\#199](https://github.com/camptocamp/docker-mapserver/pull/199) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210712112154 to 1.1.dev20210727151149 in /ci [\#198](https://github.com/camptocamp/docker-mapserver/pull/198) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump requests from 2.25.1 to 2.26.0 in /acceptance_tests [\#197](https://github.com/camptocamp/docker-mapserver/pull/197) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210709152623 to 1.1.dev20210712112154 in /ci [\#196](https://github.com/camptocamp/docker-mapserver/pull/196) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210701074602 to 1.1.dev20210709152623 in /ci [\#195](https://github.com/camptocamp/docker-mapserver/pull/195) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump osgeo/gdal from ubuntu-small-3.3.0 to ubuntu-small-3.3.1 [\#194](https://github.com/camptocamp/docker-mapserver/pull/194) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210629154910 to 1.1.dev20210701074602 in /ci [\#193](https://github.com/camptocamp/docker-mapserver/pull/193) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cwsgiutils from 4.1.3 to 4.1.4 in /acceptance_tests [\#192](https://github.com/camptocamp/docker-mapserver/pull/192) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cwsgiutils from 4.1.2 to 4.1.3 in /acceptance_tests [\#190](https://github.com/camptocamp/docker-mapserver/pull/190) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210623154317 to 1.1.dev20210629154910 in /ci [\#189](https://github.com/camptocamp/docker-mapserver/pull/189) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210617081616 to 1.1.dev20210623154317 in /ci [\#188](https://github.com/camptocamp/docker-mapserver/pull/188) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210615102932 to 1.1.dev20210617081616 in /ci [\#187](https://github.com/camptocamp/docker-mapserver/pull/187) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210614101225 to 1.1.dev20210615102932 in /ci [\#186](https://github.com/camptocamp/docker-mapserver/pull/186) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210604063451 to 1.1.dev20210614101225 in /ci [\#185](https://github.com/camptocamp/docker-mapserver/pull/185) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump pipenv from 2020.11.15 to 2021.5.29 in /acceptance_tests [\#183](https://github.com/camptocamp/docker-mapserver/pull/183) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump camptocamp/c2cwsgiutils from 3 to 4 in /acceptance_tests [\#182](https://github.com/camptocamp/docker-mapserver/pull/182) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210511092229 to 1.1.dev20210604063451 in /ci [\#181](https://github.com/camptocamp/docker-mapserver/pull/181) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210504062412 to 1.1.dev20210511092229 in /ci [\#158](https://github.com/camptocamp/docker-mapserver/pull/158) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump osgeo/gdal from ubuntu-small-3.2.2 to ubuntu-small-3.3.0 [\#143](https://github.com/camptocamp/docker-mapserver/pull/143) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210428132049 to 1.1.dev20210504062412 in /ci [\#140](https://github.com/camptocamp/docker-mapserver/pull/140) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210427101151 to 1.1.dev20210428132049 in /ci [\#139](https://github.com/camptocamp/docker-mapserver/pull/139) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210426091625 to 1.1.dev20210427101151 in /ci [\#138](https://github.com/camptocamp/docker-mapserver/pull/138) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210422085804 to 1.1.dev20210426091625 in /ci [\#137](https://github.com/camptocamp/docker-mapserver/pull/137) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210419145517 to 1.1.dev20210422085804 in /ci [\#136](https://github.com/camptocamp/docker-mapserver/pull/136) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210419082527 to 1.1.dev20210419145517 in /ci [\#135](https://github.com/camptocamp/docker-mapserver/pull/135) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump camptocamp/c2cwsgiutils from 3 to 5 in /acceptance_tests [\#134](https://github.com/camptocamp/docker-mapserver/pull/134) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210416145645 to 1.1.dev20210419082527 in /ci [\#133](https://github.com/camptocamp/docker-mapserver/pull/133) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210401100258 to 1.1.dev20210416145645 in /ci [\#132](https://github.com/camptocamp/docker-mapserver/pull/132) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210315182348 to 1.1.dev20210401100258 in /ci [\#122](https://github.com/camptocamp/docker-mapserver/pull/122) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.1.dev20210308113838 to 1.1.dev20210315182348 in /ci [\#120](https://github.com/camptocamp/docker-mapserver/pull/120) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump osgeo/gdal from ubuntu-small-3.2.1 to ubuntu-small-3.2.2 [\#119](https://github.com/camptocamp/docker-mapserver/pull/119) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210305083859 to 1.1.dev20210308113838 in /ci [\#118](https://github.com/camptocamp/docker-mapserver/pull/118) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210304083613 to 1.0.dev20210305083859 in /ci [\#117](https://github.com/camptocamp/docker-mapserver/pull/117) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210302092543 to 1.0.dev20210304083613 in /ci [\#116](https://github.com/camptocamp/docker-mapserver/pull/116) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210217133842 to 1.0.dev20210302092543 in /ci [\#115](https://github.com/camptocamp/docker-mapserver/pull/115) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210212123011 to 1.0.dev20210217133842 in /ci [\#114](https://github.com/camptocamp/docker-mapserver/pull/114) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210208135331 to 1.0.dev20210212123011 in /ci [\#113](https://github.com/camptocamp/docker-mapserver/pull/113) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210204125831 to 1.0.dev20210208135331 in /ci [\#112](https://github.com/camptocamp/docker-mapserver/pull/112) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210111121829 to 1.0.dev20210204125831 in /ci [\#111](https://github.com/camptocamp/docker-mapserver/pull/111) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210108163130 to 1.0.dev20210111121829 in /ci [\#110](https://github.com/camptocamp/docker-mapserver/pull/110) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20210107153221 to 1.0.dev20210108163130 in /ci [\#109](https://github.com/camptocamp/docker-mapserver/pull/109) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump osgeo/gdal from ubuntu-small-3.2.0 to ubuntu-small-3.2.1 [\#108](https://github.com/camptocamp/docker-mapserver/pull/108) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20201224081728 to 1.0.dev20210107153221 in /ci [\#107](https://github.com/camptocamp/docker-mapserver/pull/107) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20201223170112 to 1.0.dev20201224081728 in /ci [\#106](https://github.com/camptocamp/docker-mapserver/pull/106) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump c2cciutils from 1.0.dev20201216094446 to 1.0.dev20201223170112 in /ci [\#105](https://github.com/camptocamp/docker-mapserver/pull/105) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump osgeo/gdal from ubuntu-small-3.1.1 to ubuntu-small-3.2.0 [\#103](https://github.com/camptocamp/docker-mapserver/pull/103) ([dependabot[bot]](https://github.com/apps/dependabot))

**Closed issues:**

- Why is "latest" tag not updated? [\#254](https://github.com/camptocamp/docker-mapserver/issues/254)
- OGR WFS connection does not forward BBOX to some servers [\#184](https://github.com/camptocamp/docker-mapserver/issues/184)
- MS_MAP_PATTERN regex cannot be compiled [\#151](https://github.com/camptocamp/docker-mapserver/issues/151)
- Incomplete WMS request: VERSION parameter missing [\#123](https://github.com/camptocamp/docker-mapserver/issues/123)

## [7.6.0](https://github.com/camptocamp/docker-mapserver/tree/7.6.0) (2020-04-16)

[Full Changelog](https://github.com/camptocamp/docker-mapserver/compare/7.4.0...7.6.0)

**Merged pull requests:**

- add mapserver repository as --build-arg [\#57](https://github.com/camptocamp/docker-mapserver/pull/57) ([danduk82](https://github.com/danduk82))
- No error on removing unexisting tag [\#56](https://github.com/camptocamp/docker-mapserver/pull/56) ([sbrunner](https://github.com/sbrunner))
- Fix master [\#54](https://github.com/camptocamp/docker-mapserver/pull/54) ([sbrunner](https://github.com/sbrunner))
- Added example to readme [\#53](https://github.com/camptocamp/docker-mapserver/pull/53) ([fargusplumdoodle](https://github.com/fargusplumdoodle))
- Use multistage build [\#52](https://github.com/camptocamp/docker-mapserver/pull/52) ([sbrunner](https://github.com/sbrunner))
- Use GitHub actions [\#48](https://github.com/camptocamp/docker-mapserver/pull/48) ([sbrunner](https://github.com/sbrunner))
- GitHub actions [\#47](https://github.com/camptocamp/docker-mapserver/pull/47) ([sbrunner](https://github.com/sbrunner))
- Add server status [\#46](https://github.com/camptocamp/docker-mapserver/pull/46) ([sbrunner](https://github.com/sbrunner))
- \[Backport master\] Remove old trap in the startup script [\#45](https://github.com/camptocamp/docker-mapserver/pull/45) ([backporting[bot]](https://github.com/apps/backporting))
- \[Backport master\] Log directly to stderr [\#42](https://github.com/camptocamp/docker-mapserver/pull/42) ([backporting[bot]](https://github.com/apps/backporting))
- \[Backport master\] Add some additional information to the logs [\#37](https://github.com/camptocamp/docker-mapserver/pull/37) ([backporting[bot]](https://github.com/apps/backporting))
- Added fcgi timeout configuration override. [\#32](https://github.com/camptocamp/docker-mapserver/pull/32) ([ochriste](https://github.com/ochriste))

## [7.4.0](https://github.com/camptocamp/docker-mapserver/tree/7.4.0) (2019-04-10)

[Full Changelog](https://github.com/camptocamp/docker-mapserver/compare/7.2.0...7.4.0)

**Closed issues:**

- SVG symbol are not supported in MapServer docker image [\#25](https://github.com/camptocamp/docker-mapserver/issues/25)

**Merged pull requests:**

- Make the number fgci processes configurable [\#29](https://github.com/camptocamp/docker-mapserver/pull/29) ([pvalsecc](https://github.com/pvalsecc))
- Bind apache2 to port 80 for any user [\#28](https://github.com/camptocamp/docker-mapserver/pull/28) ([Toilal](https://github.com/Toilal))
- Add SVG symbols support [\#26](https://github.com/camptocamp/docker-mapserver/pull/26) ([yjacolin](https://github.com/yjacolin))
- Add support of environment variable with spaces [\#23](https://github.com/camptocamp/docker-mapserver/pull/23) ([sbrunner](https://github.com/sbrunner))
- Fix nonroot mode [\#22](https://github.com/camptocamp/docker-mapserver/pull/22) ([sbrunner](https://github.com/sbrunner))
- Fix the comment [\#21](https://github.com/camptocamp/docker-mapserver/pull/21) ([sbrunner](https://github.com/sbrunner))
- Add no-install-recommends option to apt-get [\#20](https://github.com/camptocamp/docker-mapserver/pull/20) ([sbrunner](https://github.com/sbrunner))
- Build fix 7.0 [\#18](https://github.com/camptocamp/docker-mapserver/pull/18) ([fredj](https://github.com/fredj))
- Update ubuntu base image to 18.04 [\#16](https://github.com/camptocamp/docker-mapserver/pull/16) ([fredj](https://github.com/fredj))

## [7.2.0](https://github.com/camptocamp/docker-mapserver/tree/7.2.0) (2018-05-14)

[Full Changelog](https://github.com/camptocamp/docker-mapserver/compare/7.0.1...7.2.0)

**Closed issues:**

- WMS connection error. MapServer not built with WMS Client support, unable to render layer [\#14](https://github.com/camptocamp/docker-mapserver/issues/14)
- Utilization d'un Alias plus standard pour l'accès au script mapserv [\#9](https://github.com/camptocamp/docker-mapserver/issues/9)
- Can't start container after kill/crash [\#8](https://github.com/camptocamp/docker-mapserver/issues/8)

**Merged pull requests:**

- Install libgd-dev instead of libgd2-xpm-dev [\#17](https://github.com/camptocamp/docker-mapserver/pull/17) ([fredj](https://github.com/fredj))
- Update ubuntu base image to 18.04 [\#15](https://github.com/camptocamp/docker-mapserver/pull/15) ([fredj](https://github.com/fredj))
- Update the versions in the README [\#13](https://github.com/camptocamp/docker-mapserver/pull/13) ([sbrunner](https://github.com/sbrunner))
- Switch to a home build [\#12](https://github.com/camptocamp/docker-mapserver/pull/12) ([pvalsecc](https://github.com/pvalsecc))
- move checkout scm at node level [\#11](https://github.com/camptocamp/docker-mapserver/pull/11) ([msutter](https://github.com/msutter))

## [7.0.1](https://github.com/camptocamp/docker-mapserver/tree/7.0.1) (2016-09-28)

[Full Changelog](https://github.com/camptocamp/docker-mapserver/compare/59545e7676047bf0db9ddd57ad6145e8060adcc8...7.0.1)

**Closed issues:**

- Failed to fetch package [\#6](https://github.com/camptocamp/docker-mapserver/issues/6)
- Avoid warning message [\#5](https://github.com/camptocamp/docker-mapserver/issues/5)

**Merged pull requests:**

- Fix apache warnings [\#7](https://github.com/camptocamp/docker-mapserver/pull/7) ([pvalsecc](https://github.com/pvalsecc))
- Be more flexible, add missing doc. [\#4](https://github.com/camptocamp/docker-mapserver/pull/4) ([sbrunner](https://github.com/sbrunner))
- Make MapServer answer on / as well [\#3](https://github.com/camptocamp/docker-mapserver/pull/3) ([pvalsecc](https://github.com/pvalsecc))
- Less steps in the image creation and cleaning the apt cache [\#2](https://github.com/camptocamp/docker-mapserver/pull/2) ([pvalsecc](https://github.com/pvalsecc))
- Add possibility to have hooks [\#1](https://github.com/camptocamp/docker-mapserver/pull/1) ([pvalsecc](https://github.com/pvalsecc))

\* _This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)_
