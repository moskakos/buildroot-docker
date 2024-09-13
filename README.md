# buildroot-docker

Clone this repo
```shell
git clone https://github.com/moskakos/buildroot-docker.git
```

Clone SnapOS to `buildroot-docker/external/snapos`
```shell
cd buildroot-docker && \
mkdir external && \
git clone https://github.com/badaix/snapos.git external/snapos
```

Fix bug in SnapOS' makefile. This might be incorrect. Please make a test build first without this fix and see if you get any errors.
```shell
cp -R external/snapos/debian external/snapos/buildroot-external/package/ && \

cp external/snapos/buildroot-external/package/snapcast/snapcast.mk external/snapos/buildroot-external/package/snapcast/snapcast.mk.bak && \

sed -i 's/\$\@D\/debian/\$TARGET_PACKAGE\/debian/g' external/snapos/buildroot-external/package/snapcast/snapcast.mk && \

sed -i 's/\$\@D\/server/\$TARGET_PACKAGE\/server/g' external/snapos/buildroot-external/package/snapcast/snapcast.mk && \

sed -i 's/\$\@D\/client/\$TARGET_PACKAGE\/client/g' external/snapos/buildroot-external/package/snapcast/snapcast.mk
```

Build `Dockerfile`
```shell
cd path/to/project/root
docker build -t buildroot-docker .
```

Finally examine all the files (`run.sh, data/*, rootfs_overlay/etc/*`) and run `./run.sh` when ready.

## License

This software is licensed under Mozilla Public License. It is based on the original work by: © 2017 Auke Willem Oosterhoff and Advanced Climate Systems, [AdvancedClimateSystems/docker-buildroot](https://github.com/vidalastudillo/docker-buildroot). It has been modified and extended by me, moskakos.